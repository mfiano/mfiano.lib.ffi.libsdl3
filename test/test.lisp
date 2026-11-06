(in-package #:mfiano.lib.ffi.libsdl3/test)

(test bindings.resolve
  (dolist (name sdl::*functions*)
    (is (c:foreign-symbol-pointer name))))

(test bindings.gpu.resolve
  (let ((names (remove-if-not (lambda (x) (search "GPU" x)) sdl::*functions*)))
    (is (= (length names) 102))
    (dolist (name names)
      (is (c:foreign-symbol-pointer name)))))

(test error.signal
  (with-video ()
    (signals sdl:sdl-error (sdl:get-window-from-id 0))))

(test init.was-init
  (with-video ()
    (is (equal (sdl:was-init :video) '(:video))))
  (is (null (sdl:was-init :video))))

(test system.cpu-cores
  (is (plusp (sdl:get-num-logical-cpu-cores))))

(test system.performance
  (let ((start (sdl:get-performance-counter)))
    (is (plusp (sdl:get-performance-frequency)))
    (is (>= (sdl:get-performance-counter) start))))

(test system.base-path
  (let ((path (sdl:get-base-path)))
    (is (stringp path))
    (is (char= (char path (1- (length path))) #\/))))

(test rect.make
  (sdl:with-rect (rect :width 3 :height 4 :x -1 :y 2)
    (is (= (sdl:rect-width rect) 3))
    (is (= (sdl:rect-height rect) 4))
    (is (= (sdl:rect-x rect) -1))
    (is (= (sdl:rect-y rect) 2))
    (is (equal (multiple-value-list (sdl:get-rect-position rect)) '(-1 2)))
    (is (equal (multiple-value-list (sdl:get-rect-size rect)) '(3 4)))))

(test rect.make.float
  (let ((rect (sdl:make-rect 3.7f0 4.2f0 :x 1.9f0 :y -0.5f0)))
    (unwind-protect
         (is (equal (multiple-value-list (sdl:get-rect-size rect)) '(3 4)))
      (sdl:destroy-rect rect))))

(test rect.make.defaults
  (sdl:with-rect (rect)
    (is (equal (multiple-value-list (sdl:get-rect-position rect)) '(0 0)))
    (is (equal (multiple-value-list (sdl:get-rect-size rect)) '(0 0)))))

(test rect.setf
  (sdl:with-rect (rect :width 1 :height 1)
    (setf (sdl:rect-x rect) -5
          (sdl:rect-y rect) -6
          (sdl:rect-width rect) 7
          (sdl:rect-height rect) 8)
    (is (equal (multiple-value-list (sdl:get-rect-position rect)) '(-5 -6)))
    (is (equal (multiple-value-list (sdl:get-rect-size rect)) '(7 8)))))

(test rect.update
  (sdl:with-rect (rect :width 1 :height 2 :x 3 :y 4)
    (sdl:update-rect rect :width 5 :y -6)
    (is (equal (multiple-value-list (sdl:get-rect-position rect)) '(3 -6)))
    (is (equal (multiple-value-list (sdl:get-rect-size rect)) '(5 2)))))

(test rect.copy
  (sdl:with-rect (rect :width 1 :height 2 :x 3 :y 4)
    (let ((copy (sdl:copy-rect rect)))
      (unwind-protect
           (progn
             (setf (sdl:rect-x rect) 9)
             (is (equal (multiple-value-list (sdl:get-rect-position copy)) '(3 4)))
             (is (equal (multiple-value-list (sdl:get-rect-size copy)) '(1 2))))
        (sdl:destroy-rect copy)))))

(test rect.intersection
  (sdl:with-rect (a :width 4 :height 4)
    (sdl:with-rect (b :width 4 :height 4 :x 2 :y 3)
      (sdl:with-rect (c :width 1 :height 1 :x 10 :y 10)
        (is (sdl:has-rect-intersection? a b))
        (is (not (sdl:has-rect-intersection? a c)))
        (is (null (sdl:get-rect-intersection a c)))
        (let ((result (sdl:get-rect-intersection a b)))
          (unwind-protect
               (progn
                 (is (equal (multiple-value-list (sdl:get-rect-position result)) '(2 3)))
                 (is (equal (multiple-value-list (sdl:get-rect-size result)) '(2 1))))
            (sdl:destroy-rect result)))))))

(test frect.make
  (sdl:with-frect (frect :width 3.5f0 :height 4f0 :x -1.25f0 :y 2f0)
    (is (= (sdl:frect-width frect) 3.5f0))
    (is (= (sdl:frect-height frect) 4f0))
    (is (= (sdl:frect-x frect) -1.25f0))
    (is (= (sdl:frect-y frect) 2f0))
    (is (equal (multiple-value-list (sdl:get-frect-position frect)) '(-1.25f0 2f0)))
    (is (equal (multiple-value-list (sdl:get-frect-size frect)) '(3.5f0 4f0)))))

(test frect.make.defaults
  (sdl:with-frect (frect)
    (is (equal (multiple-value-list (sdl:get-frect-position frect)) '(0f0 0f0)))
    (is (equal (multiple-value-list (sdl:get-frect-size frect)) '(0f0 0f0)))))

(test frect.setf
  (sdl:with-frect (frect :width 1f0 :height 1f0)
    (setf (sdl:frect-x frect) -5.5f0
          (sdl:frect-y frect) 6.5f0
          (sdl:frect-width frect) 7.5f0
          (sdl:frect-height frect) 8.5f0)
    (is (equal (multiple-value-list (sdl:get-frect-position frect)) '(-5.5f0 6.5f0)))
    (is (equal (multiple-value-list (sdl:get-frect-size frect)) '(7.5f0 8.5f0)))))

(test frect.update
  (sdl:with-frect (frect :width 1f0 :height 2f0 :x 3f0 :y 4f0)
    (sdl:update-frect frect :height 5f0 :x -6f0)
    (is (equal (multiple-value-list (sdl:get-frect-position frect)) '(-6f0 4f0)))
    (is (equal (multiple-value-list (sdl:get-frect-size frect)) '(1f0 5f0)))))

(test frect.intersection
  (sdl:with-frect (a :width 4f0 :height 4f0)
    (sdl:with-frect (b :width 4f0 :height 4f0 :x 2.5f0 :y 3f0)
      (sdl:with-frect (c :width 1f0 :height 1f0 :x 10f0 :y 10f0)
        (is (sdl:has-rect-intersection-float? a b))
        (is (not (sdl:has-rect-intersection-float? a c)))
        (is (null (sdl:get-rect-intersection-float a c)))
        (let ((result (sdl:get-rect-intersection-float a b)))
          (unwind-protect
               (progn
                 (is (equal (multiple-value-list (sdl:get-frect-position result)) '(2.5f0 3f0)))
                 (is (equal (multiple-value-list (sdl:get-frect-size result)) '(1.5f0 1f0))))
            (sdl:destroy-frect result)))))))

(test pixel.format-details
  (let ((details (sdl:get-pixel-format-details :rgba8888)))
    (is (c:pointerp details))
    (is (= (c:foreign-slot-value details '(:struct sdl::pixel-format-details) 'sdl::bits-per-pixel)
           32))
    (is (= (c:foreign-slot-value details '(:struct sdl::pixel-format-details) 'sdl::rmask)
           #xff000000))))

(test pixel.map-rgb
  (is (equal (multiple-value-list (sdl:map-rgb 1 2 3)) '(1 2 3)))
  (is (equal (multiple-value-list (sdl:map-rgb 1 2 3 :pixel-format :xbgr8888)) '(3 2 1))))

(test pixel.map-rgba
  (is (equal (multiple-value-list (sdl:map-rgba 1 2 3 4)) '(1 2 3 4)))
  (is (equal (multiple-value-list (sdl:map-rgba 1 2 3 4 :pixel-format :argb8888)) '(4 1 2 3))))

(test pixel.get-rgb
  (is (equal (multiple-value-list (sdl:get-rgb #x010203)) '(1 2 3))))

(test pixel.get-rgba
  (is (equal (multiple-value-list (sdl:get-rgba #x01020304)) '(1 2 3 4))))

(test window.make
  (with-video ()
    (let ((window (sdl:make-window 6 5 :title "biodrift" :flags '(:hidden))))
      (unwind-protect
           (progn
             (is (equal (multiple-value-list (sdl:get-window-size window)) '(6 5)))
             (is (string= (sdl:get-window-title window) "biodrift"))
             (is (c:pointer-eq (sdl:get-window-from-id (sdl:get-window-id window)) window)))
        (is (null (multiple-value-list (sdl:destroy-window window))))))))

(test window.title
  (with-window (window)
    (sdl:set-window-title window "drift")
    (is (string= (sdl:get-window-title window) "drift"))))

(test window.size
  (with-window (window)
    (sdl:set-window-size window 10 6)
    (is (equal (multiple-value-list (sdl:get-window-size window)) '(10 6)))
    (is (equal (multiple-value-list (sdl:get-window-size-in-pixels window)) '(10 6)))))

(test window.position
  (with-window (window)
    (is (every #'integerp (multiple-value-list (sdl:get-window-position window))))
    (signals sdl:sdl-error (sdl:set-window-position window :x 10 :y 20))
    (signals sdl:sdl-error (sdl:set-window-position window :x :centered :y :undefined))))

(test window.minimum-size
  (with-window (window)
    (sdl:set-window-minimum-size window 12 6)
    (sdl:set-window-size window 4 2)
    (is (equal (multiple-value-list (sdl:get-window-size window)) '(12 6)))))

(test window.maximum-size
  (with-window (window)
    (sdl:set-window-maximum-size window 12 6)
    (sdl:set-window-size window 20 10)
    (is (equal (multiple-value-list (sdl:get-window-size window)) '(12 6)))))

(test window.pixel-format
  (with-window (window)
    (is (member (sdl:get-window-pixel-format window)
                (c:foreign-enum-keyword-list 'sdl::pixel-format)))))

(test window.display
  (with-window (window)
    (let ((display-id (sdl:get-display-for-window window)))
      (is (plusp display-id))
      (is (stringp (sdl:get-display-name display-id)))
      (multiple-value-bind (mode-display-id format width height pixel-density refresh-rate)
          (sdl:get-current-display-mode display-id)
        (is (= mode-display-id display-id))
        (is (keywordp format))
        (is (plusp width))
        (is (plusp height))
        (is (plusp pixel-density))
        (is (= (sdl:get-refresh-rate window) refresh-rate)))
      (is (null (sdl:get-window-fullscreen-mode window))))))

(test window.show-hide
  (with-window (window)
    (with-event (event)
      (drain-events event)
      (sdl:show-window window)
      (is (member :window-shown (window-events event)))
      (sdl:hide-window window)
      (is (member :window-hidden (window-events event))))))

(test window.fullscreen
  (with-window (window)
    (sdl:set-window-fullscreen window)
    (is (member :fullscreen (%get-window-flags window)))
    (sdl:set-window-fullscreen window nil)
    (is (not (member :fullscreen (%get-window-flags window))))))

(test window.keyboard-grab
  (with-window (window)
    (sdl:set-window-keyboard-grab window)
    (is (member :keyboard-grabbed (%get-window-flags window)))
    (sdl:set-window-keyboard-grab window nil)
    (is (not (member :keyboard-grabbed (%get-window-flags window))))))

(test window.relative-mouse-mode
  (with-window (window)
    (is (not (sdl:window-relative-mouse-mode? window)))
    (sdl:set-window-relative-mouse-mode window)
    (is (sdl:window-relative-mouse-mode? window))
    (sdl:set-window-relative-mouse-mode window nil)
    (is (not (sdl:window-relative-mouse-mode? window)))))

(test window.state
  (with-window (window)
    (is (null (multiple-value-list (sdl:show-window window))))
    (is (null (multiple-value-list (sdl:raise-window window))))
    (is (null (multiple-value-list (sdl:hide-window window))))))

(test window.state.unsupported
  (with-window (window)
    (signals sdl:sdl-error (sdl:maximize-window window))
    (signals sdl:sdl-error (sdl:minimize-window window))
    (signals sdl:sdl-error (sdl:restore-window window))
    (signals sdl:sdl-error (sdl:set-window-resizable window))
    (signals sdl:sdl-error (sdl:set-window-always-on-top window))))

(test event.make
  (with-event (event)
    (is (eq (sdl:get-event-type event) :first))))

(test event.quit
  (with-video ()
    (with-event (event)
      (drain-events event)
      (push-event (fill-event event 'sdl::quit-event 'type :quit))
      (is (poll-event-of-type event :quit)))))

(test event.user
  (with-video ()
    (with-event (event)
      (drain-events event)
      (push-event (fill-event event 'sdl::user-event 'type #x8001))
      (is (poll-event-of-type event #x8001)))))

(test event.keyboard
  (with-window (window)
    (with-event (event)
      (drain-events event)
      (push-event (fill-event event 'sdl::keyboard-event
                              'type :key-down
                              'sdl::window-id (sdl:get-window-id window)
                              'sdl::scancode :b
                              'sdl::key :b
                              'sdl::down t))
      (is (poll-event-of-type event :key-down))
      (is (eq (sdl:get-scancode-from-event event) :b))
      (is (eq (sdl:get-keycode-from-event event) :b)))))

(test event.mouse-motion
  (with-window (window)
    (with-event (event)
      (drain-events event)
      (push-event (fill-event event 'sdl::mouse-motion-event
                              'type :mouse-motion
                              'sdl::window-id (sdl:get-window-id window)
                              'sdl::x 3.5f0
                              'sdl::y 2f0
                              'sdl::xrel -1f0
                              'sdl::yrel 1.25f0))
      (is (poll-event-of-type event :mouse-motion))
      (is (equal (multiple-value-list (sdl:get-mouse-motion-from-event event))
                 '(3.5f0 2f0 -1f0 1.25f0))))))

(test event.mouse-button
  (with-window (window)
    (with-event (event)
      (drain-events event)
      (push-event (fill-event event 'sdl::mouse-button-event
                              'type :mouse-button-down
                              'sdl::window-id (sdl:get-window-id window)
                              'sdl::button 3
                              'sdl::down t))
      (is (poll-event-of-type event :mouse-button-down))
      (is (= (sdl:get-mouse-button-from-event event) 3)))))

(test event.mouse-wheel
  (with-window (window)
    (with-event (event)
      (drain-events event)
      (push-event (fill-event event 'sdl::mouse-wheel-event
                              'type :mouse-wheel
                              'sdl::window-id (sdl:get-window-id window)
                              'sdl::x 2f0
                              'sdl::y -3.5f0))
      (is (poll-event-of-type event :mouse-wheel))
      (is (equal (multiple-value-list (sdl:get-mouse-wheel-from-event event)) '(2f0 -3.5f0))))))

(test keyboard.key-from-scancode
  (with-video ()
    (is (eq (sdl:get-key-from-scancode :a) :a))
    (is (eq (sdl:get-key-from-scancode :return) :return))))

(test keyboard.scancode-from-key
  (with-video ()
    (is (eq (sdl:get-scancode-from-key :a) :a))
    (is (eq (sdl:get-scancode-from-key :escape) :escape))))

(test mouse.cursor.visibility
  (with-window (window)
    (sdl:hide-cursor)
    (is (not (sdl:cursor-visible?)))
    (sdl:show-cursor)
    (is (sdl:cursor-visible?))))

(test mouse.warp
  (with-window (window)
    (is (null (multiple-value-list (sdl:warp-mouse-in-window 2 1.5 :window window))))))

(test renderer.make
  (with-renderer (window renderer)
    (is (c:pointer-eq (sdl:get-renderer window) renderer))
    (is (c:pointer-eq (sdl:get-render-window renderer) window))
    (is (string= (sdl:get-renderer-name renderer) "software"))
    (is (integerp (sdl:get-max-texture-size renderer)))))

(test renderer.output-size
  (with-renderer (window renderer :width 6 :height 3)
    (is (equal (multiple-value-list (sdl:get-current-render-output-size renderer)) '(6 3)))
    (with-texture (texture renderer 2 5)
      (sdl:set-render-target renderer :texture texture)
      (is (equal (multiple-value-list (sdl:get-current-render-output-size renderer)) '(2 5))))))

(test renderer.vsync
  (with-renderer (window renderer)
    (sdl:set-render-vsync renderer 0)
    (is (= (sdl:get-render-vsync renderer) 0))))

(test renderer.draw-color
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer :r 1 :g 2 :b 3 :a 4)
    (is (equal (multiple-value-list (sdl:get-render-draw-color renderer)) '(1 2 3 4)))))

(test renderer.draw-blend-mode
  (with-renderer (window renderer)
    (sdl:set-render-draw-blend-mode renderer :add)
    (is (eq (sdl:get-render-draw-blend-mode renderer) :add))
    (sdl:set-render-draw-blend-mode renderer :none)
    (is (eq (sdl:get-render-draw-blend-mode renderer) :none))))

(test renderer.scale
  (with-renderer (window renderer)
    (sdl:set-render-scale renderer :x 2f0 :y 0.5f0)
    (is (equal (multiple-value-list (sdl:get-render-scale renderer)) '(2f0 0.5f0)))))

(test renderer.viewport
  (with-renderer (window renderer)
    (sdl:with-rect (rect :width 4 :height 2 :x 1 :y 1)
      (sdl:set-render-viewport renderer :rect rect)
      (let ((viewport (sdl:get-render-viewport renderer)))
        (unwind-protect
             (progn
               (is (equal (multiple-value-list (sdl:get-rect-position viewport)) '(1 1)))
               (is (equal (multiple-value-list (sdl:get-rect-size viewport)) '(4 2))))
          (sdl:destroy-rect viewport))))))

(test renderer.clip
  (with-renderer (window renderer)
    (is (not (sdl:render-clip-enabled? renderer)))
    (sdl:with-rect (rect :width 3 :height 2 :x 1 :y 1)
      (sdl:set-render-clip-rect renderer :rect rect)
      (is (sdl:render-clip-enabled? renderer))
      (let ((clip (sdl:get-render-clip-rect renderer)))
        (unwind-protect
             (progn
               (is (equal (multiple-value-list (sdl:get-rect-position clip)) '(1 1)))
               (is (equal (multiple-value-list (sdl:get-rect-size clip)) '(3 2))))
          (sdl:destroy-rect clip))))
    (sdl:set-render-clip-rect renderer)
    (is (not (sdl:render-clip-enabled? renderer)))))

(test renderer.default-texture-scale-mode
  (with-renderer (window renderer)
    (sdl:set-default-texture-scale-mode renderer :nearest)
    (with-texture (texture renderer 2 2)
      (is (eq (sdl:get-texture-scale-mode texture) :nearest)))
    (sdl:set-default-texture-scale-mode renderer :linear)
    (with-texture (texture renderer 2 2)
      (is (eq (sdl:get-texture-scale-mode texture) :linear)))))

(test render.clear
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer :r 10 :g 20 :b 30)
    (sdl:render-clear renderer)
    (is (every-pixel? (read-pixels renderer 8 4) (rgba 10 20 30 255)))
    (is (null (multiple-value-list (sdl:render-present renderer))))))

(test render.fill-rect
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer)
    (sdl:render-clear renderer)
    (sdl:set-render-draw-color renderer :r 255)
    (sdl:with-frect (frect :width 3f0 :height 2f0 :x 1f0 :y 1f0)
      (sdl:render-fill-rect renderer :rect frect))
    (let ((pixels (read-pixels renderer 8 4)))
      (is (every-pixel? (region pixels 8 1 1 3 2) (rgba 255 0 0 255)))
      (is (every-pixel? (region pixels 8 0 0 8 1) (rgba 0 0 0 255)))
      (is (every-pixel? (region pixels 8 4 1 4 3) (rgba 0 0 0 255))))))

(test render.fill-rect.all
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer :g 255)
    (sdl:render-fill-rect renderer)
    (is (every-pixel? (read-pixels renderer 8 4) (rgba 0 255 0 255)))))

(test render.line
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer)
    (sdl:render-clear renderer)
    (sdl:set-render-draw-color renderer :r 255 :g 255 :b 255)
    (sdl:render-line renderer :x1 0f0 :y1 2f0 :x2 7f0 :y2 2f0)
    (let ((pixels (read-pixels renderer 8 4)))
      (is (every-pixel? (region pixels 8 0 2 8 1) (rgba 255 255 255 255)))
      (is (every-pixel? (region pixels 8 0 0 8 2) (rgba 0 0 0 255)))
      (is (every-pixel? (region pixels 8 0 3 8 1) (rgba 0 0 0 255))))))

(test render.target
  (with-renderer (window renderer)
    (with-texture (texture renderer 8 4)
      (is (null (sdl:get-render-target renderer)))
      (sdl:set-render-target renderer :texture texture)
      (is (c:pointer-eq (sdl:get-render-target renderer) texture))
      (sdl:set-render-draw-color renderer :r 1 :g 2 :b 3)
      (sdl:render-clear renderer)
      (is (every-pixel? (read-pixels renderer 8 4) (rgba 1 2 3 255)))
      (sdl:set-render-target renderer)
      (is (null (sdl:get-render-target renderer))))))

(test texture.make
  (with-renderer (window renderer)
    (with-texture (texture renderer 5 3 :access :streaming)
      (multiple-value-bind (format access width height) (sdl:get-texture-properties texture)
        (is (same-pixel-format? format :rgba8888))
        (is (eq access :streaming))
        (is (= width 5))
        (is (= height 3))))))

(test texture.alpha-mod
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2)
      (sdl:set-texture-alpha-mod texture 7)
      (is (= (sdl:get-texture-alpha-mod texture) 7)))))

(test texture.color-mod
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2)
      (sdl:set-texture-color-mod texture :r 1 :g 2 :b 3)
      (is (equal (multiple-value-list (sdl:get-texture-color-mod texture)) '(1 2 3))))))

(test texture.blend-mode
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2)
      (sdl:set-texture-blend-mode texture :mod)
      (is (eq (sdl:get-texture-blend-mode texture) :mod)))))

(test texture.scale-mode
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2)
      (sdl:set-texture-scale-mode texture :linear)
      (is (eq (sdl:get-texture-scale-mode texture) :linear))
      (sdl:set-texture-scale-mode texture :nearest)
      (is (eq (sdl:get-texture-scale-mode texture) :nearest)))))

(test texture.update-from-array
  (with-renderer (window renderer :width 4 :height 2)
    (with-texture (texture renderer 4 2 :access :static)
      (let ((pixels (make-pixels 4 2)))
        (sdl:update-texture/from-array texture 4 2 pixels)
        (sdl:render-texture renderer texture)
        (is (equalp (read-pixels renderer 4 2) pixels))))))

(test texture.update-from-array.offset
  (with-renderer (window renderer :width 2 :height 2)
    (with-texture (texture renderer 2 2 :access :static)
      (let ((pixels (make-pixels 4 4)))
        (sdl:update-texture/from-array texture 4 4 pixels :x 1 :y 2)
        (sdl:render-texture renderer texture)
        (is (equalp (read-pixels renderer 2 2) (region pixels 4 1 2 2 2)))))))

(test texture.update-from-array.rect
  (with-renderer (window renderer :width 4 :height 2)
    (with-texture (texture renderer 4 2 :access :static)
      (let ((background (make-u32-array 8 (rgba 0 0 0 255)))
            (pixels (make-pixels 2 1)))
        (sdl:update-texture/from-array texture 4 2 background)
        (sdl:with-rect (rect :width 2 :height 1 :x 1 :y 1)
          (sdl:update-texture/from-array texture 2 1 pixels :rect rect))
        (sdl:render-texture renderer texture)
        (let ((result (read-pixels renderer 4 2)))
          (is (equalp (region result 4 1 1 2 1) pixels))
          (is (every-pixel? (region result 4 0 0 4 1) (rgba 0 0 0 255))))))))

(test texture.lock
  (with-renderer (window renderer :width 4 :height 2)
    (with-texture (texture renderer 4 2 :access :streaming)
      (let ((pixels (make-pixels 4 2)))
        (multiple-value-bind (pointer pitch) (sdl:lock-texture texture)
          (dotimes (row 2)
            (dotimes (column 4)
              (setf (c:mem-ref pointer :uint32 (+ (* row pitch) (* column 4)))
                    (aref pixels (+ (* row 4) column))))))
        (sdl:unlock-texture texture)
        (sdl:render-texture renderer texture)
        (is (equalp (read-pixels renderer 4 2) pixels))))))

(test render.texture
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2 :access :static)
      (let ((pixels (make-pixels 2 2)))
        (sdl:update-texture/from-array texture 2 2 pixels)
        (sdl:set-render-draw-color renderer)
        (sdl:render-clear renderer)
        (sdl:with-frect (frect :width 2f0 :height 2f0 :x 3f0 :y 1f0)
          (sdl:render-texture renderer texture :dest-rect frect))
        (let ((result (read-pixels renderer 8 4)))
          (is (equalp (region result 8 3 1 2 2) pixels))
          (is (every-pixel? (region result 8 0 0 3 4) (rgba 0 0 0 255))))))))

(test render.texture.source-rect
  (with-renderer (window renderer :width 2 :height 1)
    (with-texture (texture renderer 4 2 :access :static)
      (let ((pixels (make-pixels 4 2)))
        (sdl:update-texture/from-array texture 4 2 pixels)
        (sdl:with-frect (frect :width 2f0 :height 1f0 :x 1f0 :y 1f0)
          (sdl:render-texture renderer texture :source-rect frect))
        (is (equalp (read-pixels renderer 2 1) (region pixels 4 1 1 2 1)))))))

(test render.texture.flip
  (with-renderer (window renderer :width 4 :height 2)
    (with-texture (texture renderer 4 2 :access :static)
      (let ((pixels (make-pixels 4 2)))
        (sdl:update-texture/from-array texture 4 2 pixels)
        (sdl:render-texture renderer texture :flip :horizontal)
        (is (equalp (read-pixels renderer 4 2) (mirror pixels 4 2)))))))

(test render.texture.rotate
  (with-renderer (window renderer :width 4 :height 2)
    (with-texture (texture renderer 4 2 :access :static)
      (let ((pixels (make-pixels 4 2)))
        (sdl:update-texture/from-array texture 4 2 pixels)
        (sdl:render-texture renderer texture :angle 180 :center-x 2 :center-y 1)
        (is (equalp (read-pixels renderer 4 2) (rotate-half-turn pixels)))))))
