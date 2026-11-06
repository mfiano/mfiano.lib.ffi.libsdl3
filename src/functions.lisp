(in-package #:mfiano.lib.ffi.libsdl3)

(c:defcfun ("SDL_GetError" %get-error) :string)
(c:defcfun ("SDL_ClearError" %clear-error) :bool)
(c:defcfun ("SDL_free" %free) :void (pointer :pointer))

(define-sdl-function %create-color-cursor ()
  (:name "SDL_CreateColorCursor"
   :type (:pointer (:struct cursor))
   :check #'valid-pointer?)
  (surface (:pointer (:struct surface)))
  (hot-x :int)
  (hot-y :int))

(define-sdl-function %create-renderer ()
  (:name "SDL_CreateRenderer"
   :type (:pointer (:struct renderer))
   :check #'valid-pointer?)
  (window (:pointer (:struct window)))
  (name :string))

(define-sdl-function %create-surface ()
  (:name "SDL_CreateSurface"
   :type (:pointer (:struct surface))
   :check #'valid-pointer?)
  (width :int)
  (height :int)
  (format pixel-format))

(define-sdl-function %create-surface-from ()
  (:name "SDL_CreateSurfaceFrom"
   :type (:pointer (:struct surface))
   :check #'valid-pointer?)
  (width :int)
  (height :int)
  (format pixel-format)
  (pixels :pointer)
  (pitch :int))

(define-sdl-function %create-texture ()
  (:name "SDL_CreateTexture"
   :type (:pointer (:struct texture))
   :check #'valid-pointer?)
  (renderer (:pointer (:struct renderer)))
  (format pixel-format)
  (access texture-access)
  (w :int)
  (h :int))

(define-sdl-function %create-texture-from-surface ()
  (:name "SDL_CreateTextureFromSurface"
   :type (:pointer (:struct texture))
   :check #'valid-pointer?)
  (renderer (:pointer (:struct renderer)))
  (surface (:pointer (:struct surface))))

(define-sdl-function %create-window ()
  (:name "SDL_CreateWindow"
   :type (:pointer (:struct window))
   :check #'valid-pointer?)
  (title :string)
  (w :int)
  (h :int)
  (flags window-flags))

(define-sdl-function %cursor-visible ()
  (:name "SDL_CursorVisible"
   :type :bool))

(define-sdl-function %destroy-cursor ()
  (:name "SDL_DestroyCursor")
  (cursor (:pointer (:struct cursor))))

(define-sdl-function %destroy-renderer ()
  (:name "SDL_DestroyRenderer")
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %destroy-surface ()
  (:name "SDL_DestroySurface")
  (surface (:pointer (:struct surface))))

(define-sdl-function %destroy-texture ()
  (:name "SDL_DestroyTexture")
  (texture (:pointer (:struct texture))))

(define-sdl-function %destroy-window ()
  (:name "SDL_DestroyWindow")
  (window (:pointer (:struct window))))

(define-sdl-function %duplicate-surface ()
  (:name "SDL_DuplicateSurface"
   :type (:pointer (:struct surface))
   :check #'valid-pointer?)
  (surface (:pointer (:struct surface))))

(define-sdl-function %get-base-path ()
  (:name "SDL_GetBasePath"
   :type :string
   :check #'stringp))

(define-sdl-function %get-current-display-mode ()
  (:name "SDL_GetCurrentDisplayMode"
   :type (:pointer (:struct display-mode))
   :check #'valid-pointer?)
  (display-id display-id))

(define-sdl-function %get-current-render-output-size ()
  (:name "SDL_GetCurrentRenderOutputSize"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (w (:pointer :int))
  (h (:pointer :int)))

(define-sdl-function %get-display-for-window ()
  (:name "SDL_GetDisplayForWindow"
   :type display-id
   :check #'plusp)
  (window (:pointer (:struct window))))

(define-sdl-function %get-display-name ()
  (:name "SDL_GetDisplayName"
   :type :string
   :check #'stringp)
  (display-id display-id))

(define-sdl-function %get-key-from-scancode ()
  (:name "SDL_GetKeyFromScancode"
   :type keycode)
  (scancode scancode)
  (modstate keymod)
  (key-event :bool))

(define-sdl-function %get-num-logical-cpu-cores ()
  (:name "SDL_GetNumLogicalCPUCores"
   :type :int))

(define-sdl-function %get-number-property ()
  (:name "SDL_GetNumberProperty"
   :type :int64)
  (props properties-id)
  (name :string)
  (default-value :int64))

(define-sdl-function %get-performance-counter ()
  (:name "SDL_GetPerformanceCounter"
   :type :uint64))

(define-sdl-function %get-performance-frequency ()
  (:name "SDL_GetPerformanceFrequency"
   :type :uint64))

(define-sdl-function %get-pixel-format-details ()
  (:name "SDL_GetPixelFormatDetails"
   :type (:pointer (:struct pixel-format-details))
   :check #'valid-pointer?)
  (format pixel-format))

(define-sdl-function %get-pref-path ()
  (:name "SDL_GetPrefPath"
   :type :pointer
   :check #'valid-pointer?)
  (org :string)
  (app :string))

(define-sdl-function %get-rect-intersection ()
  (:name "SDL_GetRectIntersection"
   :type :bool)
  (a (:pointer (:struct rect)))
  (b (:pointer (:struct rect)))
  (result (:pointer (:struct rect))))

(define-sdl-function %get-rect-intersection-float ()
  (:name "SDL_GetRectIntersectionFloat"
   :type :bool)
  (a (:pointer (:struct frect)))
  (b (:pointer (:struct frect)))
  (result (:pointer (:struct frect))))

(define-sdl-function %get-render-clip-rect ()
  (:name "SDL_GetRenderClipRect"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct rect))))

(define-sdl-function %get-render-draw-blend-mode ()
  (:name "SDL_GetRenderDrawBlendMode"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (blend-mode (:pointer blend-mode)))

(define-sdl-function %get-render-draw-color ()
  (:name "SDL_GetRenderDrawColor"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8))
  (a (:pointer :uint8)))

(define-sdl-function %get-render-scale ()
  (:name "SDL_GetRenderScale"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (scale-x (:pointer :float))
  (scale-y (:pointer :float)))

(define-sdl-function %get-render-target ()
  (:name "SDL_GetRenderTarget"
   :type (:pointer (:struct texture)))
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %get-render-viewport ()
  (:name "SDL_GetRenderViewport"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct rect))))

(define-sdl-function %get-render-vsync ()
  (:name "SDL_GetRenderVSync"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (vsync (:pointer :int)))

(define-sdl-function %get-render-window ()
  (:name "SDL_GetRenderWindow"
   :type (:pointer (:struct window))
   :check #'valid-pointer?)
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %get-renderer ()
  (:name "SDL_GetRenderer"
   :type (:pointer (:struct renderer))
   :check #'valid-pointer?)
  (window (:pointer (:struct window))))

(define-sdl-function %get-renderer-name ()
  (:name "SDL_GetRendererName"
   :type :string
   :check #'stringp)
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %get-renderer-properties ()
  (:name "SDL_GetRendererProperties"
   :type properties-id
   :check #'plusp)
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %get-rgb ()
  (:name "SDL_GetRGB")
  (pixelvalue :uint32)
  (format (:pointer (:struct pixel-format-details)))
  (palette (:pointer (:struct palette)))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8)))

(define-sdl-function %get-rgba ()
  (:name "SDL_GetRGBA")
  (pixelvalue :uint32)
  (format (:pointer (:struct pixel-format-details)))
  (palette (:pointer (:struct palette)))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8))
  (a (:pointer :uint8)))

(define-sdl-function %get-scancode-from-key ()
  (:name "SDL_GetScancodeFromKey"
   :type scancode)
  (key keycode)
  (modstate (:pointer keymod)))

(define-sdl-function %get-texture-alpha-mod ()
  (:name "SDL_GetTextureAlphaMod"
   :type :bool
   :check #'identity)
  (texture (:pointer (:struct texture)))
  (alpha (:pointer :uint8)))

(define-sdl-function %get-texture-blend-mode ()
  (:name "SDL_GetTextureBlendMode"
   :type :bool
   :check #'identity)
  (texture (:pointer (:struct texture)))
  (blend-mode (:pointer blend-mode)))

(define-sdl-function %get-texture-color-mod ()
  (:name "SDL_GetTextureColorMod"
   :type :bool
   :check #'identity)
  (texture (:pointer (:struct texture)))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8)))

(define-sdl-function %get-texture-properties ()
  (:name "SDL_GetTextureProperties"
   :type properties-id
   :check #'plusp)
  (texture (:pointer (:struct texture))))

(define-sdl-function %get-texture-scale-mode ()
  (:name "SDL_GetTextureScaleMode"
   :type :bool
   :check #'identity)
  (texture (:pointer (:struct texture)))
  (scale-mode (:pointer scale-mode)))

(define-sdl-function %get-window-from-id ()
  (:name "SDL_GetWindowFromID"
   :type (:pointer (:struct window))
   :check #'valid-pointer?)
  (id window-id))

(define-sdl-function %get-window-fullscreen-mode ()
  (:name "SDL_GetWindowFullscreenMode"
   :type (:pointer (:struct display-mode)))
  (window (:pointer (:struct window))))

(define-sdl-function %get-window-id ()
  (:name "SDL_GetWindowID"
   :type window-id
   :check #'plusp)
  (window (:pointer (:struct window))))

(define-sdl-function %get-window-pixel-format ()
  (:name "SDL_GetWindowPixelFormat"
   :type pixel-format
   :check (lambda (x) (not (eq x :unknown))))
  (window (:pointer (:struct window))))

(define-sdl-function %get-window-position ()
  (:name "SDL_GetWindowPosition"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (x (:pointer :int))
  (y (:pointer :int)))

(define-sdl-function %get-window-relative-mouse-mode ()
  (:name "SDL_GetWindowRelativeMouseMode"
   :type :bool)
  (window (:pointer (:struct window))))

(define-sdl-function %get-window-size ()
  (:name "SDL_GetWindowSize"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (w (:pointer :int))
  (h (:pointer :int)))

(define-sdl-function %get-window-size-in-pixels ()
  (:name "SDL_GetWindowSizeInPixels"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (w (:pointer :int))
  (h (:pointer :int)))

(define-sdl-function %get-window-title ()
  (:name "SDL_GetWindowTitle"
   :type :string)
  (window (:pointer (:struct window))))

(define-sdl-function %gl-create-context ()
  (:name "SDL_GL_CreateContext"
   :type gl-context
   :check #'valid-pointer?)
  (window (:pointer (:struct window))))

(define-sdl-function %gl-destroy-context ()
  (:name "SDL_GL_DestroyContext"
   :type :bool
   :check #'identity)
  (context gl-context))

(define-sdl-function %gl-get-attribute ()
  (:name "SDL_GL_GetAttribute"
   :type :bool
   :check #'identity)
  (attr gl-attr)
  (value (:pointer :int)))

(define-sdl-function %gl-get-current-context ()
  (:name "SDL_GL_GetCurrentContext"
   :type gl-context
   :check #'valid-pointer?))

(define-sdl-function %gl-get-current-window ()
  (:name "SDL_GL_GetCurrentWindow"
   :type (:pointer (:struct window))
   :check #'valid-pointer?))

(define-sdl-function %gl-get-swap-interval ()
  (:name "SDL_GL_GetSwapInterval"
   :type :bool
   :check #'identity)
  (interval (:pointer :int)))

(define-sdl-function %gl-make-current ()
  (:name "SDL_GL_MakeCurrent"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (context gl-context))

(define-sdl-function %gl-reset-attributes ()
  (:name "SDL_GL_ResetAttributes"))

(define-sdl-function %gl-set-attribute ()
  (:name "SDL_GL_SetAttribute"
   :type :bool
   :check #'identity)
  (attr gl-attr)
  (value :int))

(define-sdl-function %gl-set-swap-interval ()
  (:name "SDL_GL_SetSwapInterval"
   :type :bool
   :check #'identity)
  (interval :int))

(define-sdl-function %gl-swap-window ()
  (:name "SDL_GL_SwapWindow"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window))))

(define-sdl-function %has-rect-intersection ()
  (:name "SDL_HasRectIntersection"
   :type :bool)
  (a (:pointer (:struct rect)))
  (b (:pointer (:struct rect))))

(define-sdl-function %has-rect-intersection-float ()
  (:name "SDL_HasRectIntersectionFloat"
   :type :bool)
  (a (:pointer (:struct frect)))
  (b (:pointer (:struct frect))))

(define-sdl-function %hide-cursor ()
  (:name "SDL_HideCursor"
   :type :bool
   :check #'identity))

(define-sdl-function %hide-window ()
  (:name "SDL_HideWindow"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window))))

(define-sdl-function %init ()
  (:name "SDL_Init"
   :type :bool
   :check #'identity)
  (flags init-flags))

(define-sdl-function %lock-texture ()
  (:name "SDL_LockTexture"
   :type :bool
   :check #'identity)
  (texture (:pointer (:struct texture)))
  (rect (:pointer (:struct rect)))
  (pixels (:pointer :pointer))
  (pitch (:pointer :int)))

(define-sdl-function %map-rgb ()
  (:name "SDL_MapRGB"
   :type :uint32)
  (format (:pointer (:struct pixel-format-details)))
  (palette (:pointer (:struct palette)))
  (r :uint8)
  (g :uint8)
  (b :uint8))

(define-sdl-function %map-rgba ()
  (:name "SDL_MapRGBA"
   :type :uint32)
  (format (:pointer (:struct pixel-format-details)))
  (palette (:pointer (:struct palette)))
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(define-sdl-function %maximize-window ()
  (:name "SDL_MaximizeWindow"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window))))

(define-sdl-function %minimize-window ()
  (:name "SDL_MinimizeWindow"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window))))

(define-sdl-function %poll-event ()
  (:name "SDL_PollEvent"
   :type :bool)
  (event (:pointer (:union event))))

(define-sdl-function %quit ()
  (:name "SDL_Quit"))

(define-sdl-function %raise-window ()
  (:name "SDL_RaiseWindow"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window))))

(define-sdl-function %render-clear ()
  (:name "SDL_RenderClear"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %render-clip-enabled ()
  (:name "SDL_RenderClipEnabled"
   :type :bool)
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %render-fill-rect ()
  (:name "SDL_RenderFillRect"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct frect))))

(define-sdl-function %render-line ()
  (:name "SDL_RenderLine"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float))

(define-sdl-function %render-present ()
  (:name "SDL_RenderPresent"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %render-texture-rotated ()
  (:name "SDL_RenderTextureRotated"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (texture (:pointer (:struct texture)))
  (srcrect (:pointer (:struct frect)))
  (dstrect (:pointer (:struct frect)))
  (angle :double)
  (center (:pointer (:struct fpoint)))
  (flip flip-mode))

(define-sdl-function %restore-window ()
  (:name "SDL_RestoreWindow"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window))))

(define-sdl-function %set-cursor ()
  (:name "SDL_SetCursor"
   :type :bool
   :check #'identity)
  (cursor (:pointer (:struct cursor))))

(define-sdl-function %set-default-texture-scale-mode ()
  (:name "SDL_SetDefaultTextureScaleMode"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (scale-mode scale-mode))

(define-sdl-function %set-hint ()
  (:name "SDL_SetHint"
   :type :bool
   :check #'identity)
  (name :string)
  (value :string))

(define-sdl-function %set-render-clip-rect ()
  (:name "SDL_SetRenderClipRect"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct rect))))

(define-sdl-function %set-render-draw-blend-mode ()
  (:name "SDL_SetRenderDrawBlendMode"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (blend-mode blend-mode))

(define-sdl-function %set-render-draw-color ()
  (:name "SDL_SetRenderDrawColor"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(define-sdl-function %set-render-scale ()
  (:name "SDL_SetRenderScale"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (scale-x :float)
  (scale-y :float))

(define-sdl-function %set-render-target ()
  (:name "SDL_SetRenderTarget"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (texture (:pointer (:struct texture))))

(define-sdl-function %set-render-viewport ()
  (:name "SDL_SetRenderViewport"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct rect))))

(define-sdl-function %set-render-vsync ()
  (:name "SDL_SetRenderVSync"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (vsync :int))

(define-sdl-function %set-texture-alpha-mod ()
  (:name "SDL_SetTextureAlphaMod"
   :type :bool
   :check #'identity)
  (texture (:pointer (:struct texture)))
  (alpha :uint8))

(define-sdl-function %set-texture-blend-mode ()
  (:name "SDL_SetTextureBlendMode"
   :type :bool
   :check #'identity)
  (texture (:pointer (:struct texture)))
  (blend-mode blend-mode))

(define-sdl-function %set-texture-color-mod ()
  (:name "SDL_SetTextureColorMod"
   :type :bool
   :check #'identity)
  (texture (:pointer (:struct texture)))
  (r :uint8)
  (g :uint8)
  (b :uint8))

(define-sdl-function %set-texture-scale-mode ()
  (:name "SDL_SetTextureScaleMode"
   :type :bool
   :check #'identity)
  (texture (:pointer (:struct texture)))
  (scale-mode scale-mode))

(define-sdl-function %set-window-always-on-top ()
  (:name "SDL_SetWindowAlwaysOnTop"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (on-top :bool))

(define-sdl-function %set-window-fullscreen ()
  (:name "SDL_SetWindowFullscreen"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (fullscreen :bool))

(define-sdl-function %set-window-keyboard-grab ()
  (:name "SDL_SetWindowKeyboardGrab"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (grabbed :bool))

(define-sdl-function %set-window-maximum-size ()
  (:name "SDL_SetWindowMaximumSize"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (max-w :int)
  (max-h :int))

(define-sdl-function %set-window-minimum-size ()
  (:name "SDL_SetWindowMinimumSize"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (min-w :int)
  (min-h :int))

(define-sdl-function %set-window-position ()
  (:name "SDL_SetWindowPosition"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (x :int)
  (y :int))

(define-sdl-function %set-window-relative-mouse-mode ()
  (:name "SDL_SetWindowRelativeMouseMode"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (enabled :bool))

(define-sdl-function %set-window-resizable ()
  (:name "SDL_SetWindowResizable"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (resizable :bool))

(define-sdl-function %set-window-size ()
  (:name "SDL_SetWindowSize"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (w :int)
  (h :int))

(define-sdl-function %set-window-title ()
  (:name "SDL_SetWindowTitle"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window)))
  (title :string))

(define-sdl-function %show-cursor ()
  (:name "SDL_ShowCursor"
   :type :bool
   :check #'identity))

(define-sdl-function %show-window ()
  (:name "SDL_ShowWindow"
   :type :bool
   :check #'identity)
  (window (:pointer (:struct window))))

(define-sdl-function %unlock-texture ()
  (:name "SDL_UnlockTexture")
  (texture (:pointer (:struct texture))))

(define-sdl-function %update-texture ()
  (:name "SDL_UpdateTexture"
   :type :bool
   :check #'identity)
  (texture (:pointer (:struct texture)))
  (rect (:pointer (:struct rect)))
  (pixels :pointer)
  (pitch :int))

(define-sdl-function %warp-mouse-in-window ()
  (:name "SDL_WarpMouseInWindow")
  (window (:pointer (:struct window)))
  (x :float)
  (y :float))

(define-sdl-function %was-init ()
  (:name "SDL_WasInit"
   :type init-flags)
  (flags init-flags))
