(in-package #:mfiano.lib.ffi.libsdl3)

(eval-always
  (c:define-foreign-library libsdl3
    (:unix (:or "libSDL3.so.0" "libSDL3.so"))
    (:darwin (:or (:framework "SDL3") (:default "libSDL3")))
    (:windows "SDL3.dll")
    (t (:default "libSDL3")))
  (c:use-foreign-library libsdl3))

(define-constant +minimum-version+ 3004000)

(let ((version (c:foreign-funcall "SDL_GetVersion" :int)))
  (when (< version +minimum-version+)
    (error "libsdl3 requires SDL 3.4.0 or later, but SDL ~d.~d.~d is loaded."
           (floor version 1000000)
           (mod (floor version 1000) 1000)
           (mod version 1000))))

(define-condition sdl-error (error)
  ((%message
    :reader message
    :initarg :message))
  (:report
   (lambda (condition stream)
     (format stream "SDL error: ~a" (message condition)))))

(deftype object () 'c:foreign-pointer)

(defun valid-pointer? (pointer)
  (and (c:pointerp pointer)
       (not (c:null-pointer-p pointer))))

(defun foreign-slot-values (object type)
  (values-list (mapcar (lambda (x) (c:foreign-slot-value object type x))
                       (c:foreign-slot-names type))))

(defun scancode->keycode (x)
  (logior (c:foreign-enum-value 'scancode x) #.(shl 1 30)))

(defun encode-fourcc (string)
  (let ((value 0))
    (setf (ldb (byte 8 0) value) (char-code (char string 0))
          (ldb (byte 8 8) value) (char-code (char string 1))
          (ldb (byte 8 16) value) (char-code (char string 2))
          (ldb (byte 8 24) value) (char-code (char string 3)))
    value))

(defun encode-pixel-format (type order layout bits bytes)
  (let ((order (ensure-list order))
        (layout (ensure-list layout)))
    (destructuring-bind (order-key &optional order-type) order
      (destructuring-bind (layout-key &optional layout-type) layout
        (let ((type (c:foreign-enum-value 'pixel-type type))
              (order (if order-type (c:foreign-enum-value order-type order-key) order-key))
              (layout (if layout-type (c:foreign-enum-value layout-type layout-key) layout-key)))
          (logior (shl 1 28) (shl type 24) (shl order 20) (shl layout 16) (shl bits 8) bytes))))))

(defvar *functions* nil)

(defmacro define-sdl-function (name () &body (options . field-specs))
  (with-gensyms (result)
    (destructuring-bind (&key ((:name sdl-name)) (type :void) check) options
      (let ((%name (symbolicate '#:% name)))
        `(progn
           (pushnew ,sdl-name *functions* :test #'string=)
           (c:defcfun (,sdl-name ,%name) ,type ,@field-specs)
           (defun ,name ,(mapcar #'first field-specs)
             (let ((,result (,%name ,@(mapcar #'first field-specs))))
               ,@(when check
                   `((unless (funcall ,check ,result)
                       (error 'sdl-error :message (prog1 (%get-error) (%clear-error))))))
               ,result)))))))

(defmacro with-free-on-error ((var) &body body)
  (with-gensyms (success?)
    `(let ((,success? nil))
       (unwind-protect (prog1 (progn ,@body) (setf ,success? t))
         (unless ,success?
           (c:foreign-free ,var))))))

(defun make-object (type &rest args)
  (let* ((type `(:struct ,type))
         (object (c:foreign-alloc type)))
    (with-free-on-error (object)
      (do-plist (k v args)
        (setf (c:foreign-slot-value object type k) v))
      object)))

(defun free-object (object)
  (check-type object object)
  (c:foreign-free object)
  (values))

(defun member-keys (type)
  `(member ,@(c:foreign-enum-keyword-list type)))
