(asdf:defsystem #:mfiano.lib.ffi.libsdl3
  :description "Low-level libSDL3 bindings and opinionated wrappers"
  :author "Michael Fiano <michael.fiano@gmail.com>"
  :license "MIT"
  :homepage "https://github.com/mfiano/mfiano.lib.ffi.libsdl3"
  :encoding :utf-8
  :depends-on
  (#:mfiano.lib.base
   #:cffi
   #:trivial-features)
  :pathname "src"
  :serial t
  :components
  ((:file "package")
   (:file "common")
   (:file "types")
   (:file "gpu-types")
   (:file "functions")
   (:file "gpu-functions")
   (:file "wrappers")))
