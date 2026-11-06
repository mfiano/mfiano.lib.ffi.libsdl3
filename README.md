# mfiano.lib.ffi.libsdl3

CFFI bindings plus thin, Lisp-friendly wrappers for **SDL3 (Simple DirectMedia Layer 3.x)**.

The design goal is "no drama": keep the API close to SDL3, but make it comfortable from Common Lisp: keywords for enums/flags, predictable wrapper names, and errors signaled as Lisp conditions.

## What's in here

- CFFI bindings for the parts of SDL3 the wrappers need, plus all of `SDL_gpu.h` and the GPU functions of `SDL_render.h`.
- Wrapper functions that:
  - accept keyword flags (often `&rest`),
  - convert common things to the right C shapes,
  - and signal `sdl-error` when SDL reports failure.

It's intentionally not a huge framework layer.

## Requirements

- **SDL 3.4 or later** installed on your system. Loading the library signals an error on an older SDL.
  - Arch: `pacman -S sdl3`
  - Ubuntu/Debian: `apt install libsdl3-0`
  - macOS (Homebrew): `brew install sdl3`
- Common Lisp libraries:
  - `cffi`
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

## Quickstart (window + event loop)

This is deliberately "SDL-shaped" code.

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

A few patterns show up everywhere:

* **Keyword enums/flags.** Where SDL expects a bitmask or enum, the wrappers accept keywords.

  * Example: `(init :video :events)`
  * Example: `(make-window 800 450 :flags '(:hidden :resizable))`
  * Example: `(render-texture renderer texture :flip :horizontal)`

* **Wrappers are the public API.** The bindings are generated with a macro (`define-sdl-function`) and have `%`-prefixed entrypoints, which stay internal. The exported functions are the ergonomic wrappers.

* **Naming follows SDL3.** Each wrapper is named after the SDL3 function it calls, in Lisp style: `SDL_RenderTexture` is `render-texture`, `SDL_GetRenderClipRect` is `get-render-clip-rect`, `SDL_GetDisplayForWindow` is `get-display-for-window`. Constructors are `make-*` and destructors are `destroy-*`, and boolean queries end in `?`, such as `render-clip-enabled?`.

* **Display IDs, not indices.** Display functions take the `SDL_DisplayID` that `get-display-for-window` returns.

* **Floats where SDL3 uses floats.** Rendering takes `frect`s and float coordinates, and mouse events report float positions.

## GPU

All of `SDL_gpu.h` is bound except `SDL_SetGPUBlendConstants`, which takes a struct by value and would need `cffi-libffi`. The GPU functions of `SDL_render.h` are bound too: `SDL_CreateGPURenderer`, `SDL_GetGPURendererDevice`, and the GPU render state functions for custom shaders. These are raw bindings without wrappers, so they are internal `%`-prefixed symbols of the package: `(mfiano.lib.ffi.libsdl3::%create-gpu-device ...)`.

## Error handling

Most SDL failures are converted into a Lisp condition:

* Condition type: `sdl-error`
* Message: taken from `SDL_GetError`

So you can do the usual:

```lisp
(handler-case (init :video)
  (sdl-error (c)
    (format *error-output* "SDL exploded: ~a~%" c)))
```

## Memory management

SDL objects created through this library are **foreign pointers**. This library does not try to be clever with GC finalizers: you are expected to call the matching destroy function.

Typical pairs:

* `make-window` / `destroy-window`
* `make-renderer` / `destroy-renderer`
* `make-texture` / `destroy-texture`
* `make-event` / `destroy-event`

For temporary rectangles there are helpers like:

* `with-rect` and `with-frect` (allocated and freed around the body)

## What SDL3 areas are covered?

This library focuses mainly on the pieces most games/tools need immediately:

* init/quit, error strings
* windows + display info
* renderers + textures
* events + keyboard/mouse helpers
* pixel formats
* the GPU API
* a handful of small utilities (timing, paths, CPU count)

Surfaces, and the custom cursors made from them, are not supported. SDL requires a surface to be freed before the pixel data it borrows, which this library cannot ensure for a Lisp array, and the renderer needs no surfaces: `update-texture/from-array` uploads a Lisp array into a texture.

If you need something SDL3 exposes but this wrapper doesn't, adding it is usually straightforward: follow the pattern in `src/common.lisp` (`define-sdl-function`) and mirror the style used in `src/functions.lisp` and `src/wrappers.lisp`.

## Tests

The tests run headless on SDL's `offscreen` video driver and software renderer, so they need no display or GPU:

```lisp
(asdf:test-system :mfiano.lib.ffi.libsdl3)
```

## License

Licensed under the MIT License.
