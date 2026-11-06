(in-package #:mfiano.lib.base.pkg)

(define-package #:mfiano.lib.ffi.libsdl3/test
  (:local-nicknames
   (#:c #:cffi)
   (#:sdl #:mfiano.lib.ffi.libsdl3)
   (#:sv #:static-vectors))
  (:use #:mfiano.lib.base.util #:1am))

(in-package #:mfiano.lib.ffi.libsdl3/test)

(c:defcstruct surface
  (flags :uint32)
  (format sdl::pixel-format)
  (w :int)
  (h :int)
  (pitch :int)
  (pixels :pointer)
  (refcount :int)
  (reserved :pointer))

(c:defcfun ("SDL_ConvertPixels" %convert-pixels) :bool
  (width :int)
  (height :int)
  (src-format sdl::pixel-format)
  (src :pointer)
  (src-pitch :int)
  (dst-format sdl::pixel-format)
  (dst :pointer)
  (dst-pitch :int))

(c:defcfun ("SDL_DestroySurface" %destroy-surface) :void
  (surface :pointer))

(c:defcfun ("SDL_GetWindowFlags" %get-window-flags) sdl::window-flags
  (window :pointer))

(c:defcfun ("SDL_PushEvent" %push-event) :bool
  (event :pointer))

(c:defcfun ("SDL_RenderReadPixels" %render-read-pixels) :pointer
  (renderer :pointer)
  (rect :pointer))

(defmacro with-video (() &body body)
  `(progn
     (sdl::%set-hint "SDL_VIDEO_DRIVER" "offscreen")
     (sdl:init :video)
     (unwind-protect (progn ,@body)
       (sdl:quit))))

(defmacro with-window ((window &key (width 8) (height 4)) &body body)
  `(with-video ()
     (let ((,window (sdl:make-window ,width ,height :flags '(:hidden))))
       (unwind-protect (progn ,@body)
         (sdl:destroy-window ,window)))))

(defmacro with-renderer ((window renderer &key (width 8) (height 4)) &body body)
  `(with-window (,window :width ,width :height ,height)
     (let ((,renderer (sdl:make-renderer ,window :name "software")))
       (unwind-protect (progn ,@body)
         (sdl:destroy-renderer ,renderer)))))

(defmacro with-texture ((texture renderer width height &key (access :target)) &body body)
  `(let ((,texture (sdl:make-texture ,renderer ,width ,height :access ,access)))
     (unwind-protect (progn ,@body)
       (sdl:destroy-texture ,texture))))

(defmacro with-event ((event) &body body)
  `(let ((,event (sdl:make-event)))
     (unwind-protect (progn ,@body)
       (sdl:destroy-event ,event))))

(defun rgba (r g b a)
  (logior (ash r 24) (ash g 16) (ash b 8) a))

(defun make-pixels (width height)
  (let ((pixels (make-u32-array (* width height))))
    (dotimes (i (* width height) pixels)
      (setf (aref pixels i) (rgba (* i 15) (- 255 (* i 15)) (* i 7) 255)))))

(defun region (pixels width x y region-width region-height)
  (let ((result (make-u32-array (* region-width region-height))))
    (dotimes (row region-height result)
      (dotimes (column region-width)
        (setf (aref result (+ (* row region-width) column))
              (aref pixels (+ (* (+ y row) width) x column)))))))

(defun mirror (pixels width height)
  (let ((result (make-u32-array (* width height))))
    (dotimes (row height result)
      (dotimes (column width)
        (setf (aref result (+ (* row width) column))
              (aref pixels (+ (* row width) (- width column 1))))))))

(defun rotate-half-turn (pixels)
  (reverse pixels))

(defun read-pixels (renderer width height)
  (let ((surface (%render-read-pixels renderer (c:null-pointer)))
        (pixels (make-u32-array (* width height))))
    (assert (not (c:null-pointer-p surface)))
    (unwind-protect
         (c:with-foreign-slots ((format w h (source pixels) pitch) surface (:struct surface))
           (assert (and (= w width) (= h height)))
           (sv:with-static-vector (buffer (length pixels) :element-type 'u32 :initial-element 0)
             (assert (%convert-pixels width height format source pitch
                                      :rgba8888 (sv:static-vector-pointer buffer) (* width 4)))
             (replace pixels buffer)))
      (%destroy-surface surface))
    pixels))

(defun every-pixel? (pixels value)
  (every (lambda (x) (= x value)) pixels))

(defun window-events (event)
  (loop :while (sdl:poll-event event)
        :for type := (sdl:get-event-type event)
        :when (and (keywordp type) (eql (search "WINDOW-" (symbol-name type)) 0))
          :collect type))

(defun drain-events (event)
  (loop :while (sdl:poll-event event)))

(defun fill-event (event type &rest slots)
  (let ((struct `(:struct ,type)))
    (dotimes (i (c:foreign-type-size '(:union sdl::event)))
      (setf (c:mem-aref event :uint8 i) 0))
    (do-plist (slot value slots)
      (setf (c:foreign-slot-value event struct slot) value))
    event))

(defun push-event (event)
  (assert (%push-event event)))

(defun poll-event-of-type (event type)
  (loop :while (sdl:poll-event event)
        :when (eq (sdl:get-event-type event) type)
          :return t))

(defun same-pixel-format? (a b)
  (= (c:foreign-enum-value 'sdl::pixel-format a)
     (c:foreign-enum-value 'sdl::pixel-format b)))
