# mfiano.lib.ffi.libsdl3

CFFI bindings for SDL3 (Simple DirectMedia Layer 3.x), with thin Common Lisp wrappers over them.

The wrappers keep the shape and naming of SDL3's API. They take keywords where SDL takes enums or flags, and they signal `sdl-error` when SDL reports a failure.

## What's in here

- CFFI bindings for the parts of SDL3 the wrappers need, plus `SDL_gpu.h` and the GPU functions of `SDL_render.h`.
- Wrapper functions, which make up the exported API.

## Requirements

- SDL 3.4 or later installed on the system. Loading the library signals an error on an older SDL.
  - Arch: `pacman -S sdl3`
  - Ubuntu/Debian: `apt install libsdl3-0`
  - macOS (Homebrew): `brew install sdl3`
- Common Lisp libraries:
  - `cffi`
  - `static-vectors`
  - `trivial-features`
  - `mfiano.lib.base`

## Loading

ASDF system name:

```lisp
(asdf:load-system :mfiano.lib.ffi.libsdl3)
```

Package:

```lisp
(defpackage #:my-demo
  (:use #:cl #:mfiano.lib.ffi.libsdl3))
```

## Example

This opens a window and clears it every frame until the window is closed.

```lisp
(in-package #:my-demo)

(defun run ()
  (init :video)
  (let ((window (make-window 800 450 :title "My Demo"))
        (renderer nil)
        (event (make-event)))
    (unwind-protect
        (progn
          (setf renderer (make-renderer window))
          (set-render-vsync renderer 1)
          (loop
            (loop :while (poll-event event)
                  :do (when (eq (get-event-type event) :quit)
                        (return-from run nil)))
            (set-render-draw-color renderer :r 20 :g 20 :b 20 :a 255)
            (render-clear renderer)
            (render-present renderer)))
      (when renderer (destroy-renderer renderer))
      (destroy-window window)
      (destroy-event event)
      (quit))))
```

## Conventions

- Where SDL expects a bitmask or enum, the wrappers accept keywords:
  - `(init :video :events)`
  - `(make-window 800 450 :flags '(:hidden :resizable))`
  - `(set-texture-blend-mode texture :add)`
- `render-texture` flips with the generalized booleans `:flip-x` and `:flip-y`, so `(render-texture renderer texture :flip-x t)` mirrors the texture horizontally.
- The exported wrappers are the public API. The bindings are generated with the `define-sdl-function` macro, and their `%`-prefixed names stay internal.
- Each wrapper is named after the SDL3 function it calls, in Lisp style: `SDL_RenderTexture` is `render-texture` and `SDL_GetDisplayForWindow` is `get-display-for-window`. Constructors are `make-*` and destructors are `destroy-*`. Boolean queries end in `?`, such as `render-clip-enabled?`.
- Display functions take the `SDL_DisplayID` that `get-display-for-window` returns.
- Rendering takes `frect`s and float coordinates, and mouse events report float positions, as in SDL3.

## GPU

All of `SDL_gpu.h` is bound except `SDL_SetGPUBlendConstants`, which takes a struct by value and would need `cffi-libffi`. The GPU functions of `SDL_render.h` are bound too, including the GPU render state functions for custom shaders. These bindings have no wrappers, so they are internal `%`-prefixed symbols of the package: `(mfiano.lib.ffi.libsdl3::%create-gpu-device ...)`.

## Error handling

Most bindings check SDL's result and signal `sdl-error` on failure. The condition reports the message from `SDL_GetError`.

```lisp
(handler-case (init :video)
  (sdl-error (c)
    (format *error-output* "~a~%" c)))
```

## Memory management

SDL objects created through this library are foreign pointers, and the library sets no finalizers on them. Free each one with the matching destroy function:

* `make-window` / `destroy-window`
* `make-renderer` / `destroy-renderer`
* `make-texture` / `destroy-texture`
* `make-event` / `destroy-event`

`with-rect` and `with-frect` allocate a temporary rectangle and free it when the body exits.

## Coverage

The library covers these areas of SDL3:

* init/quit and error strings
* windows and display info
* renderers and textures
* OpenGL contexts
* events, with keyboard and mouse helpers
* pixel formats
* the GPU API
* timing
* base and preference paths
* the logical CPU core count

Surfaces are not supported, and neither are the custom cursors made from them. SDL requires a surface to be freed before the pixel data it borrows, which this library cannot ensure for a Lisp array. The renderer needs no surfaces, since `update-texture/from-array` uploads a Lisp array into a texture.

To add an SDL3 function this library lacks, bind it in `src/functions.lisp` with `define-sdl-function` from `src/common.lisp`, and wrap it in `src/wrappers.lisp`.

## Tests

The tests run headless on SDL's `offscreen` video driver and software renderer, so they need no display or GPU:

```lisp
(asdf:test-system :mfiano.lib.ffi.libsdl3)
```

## License

Licensed under the MIT License.
