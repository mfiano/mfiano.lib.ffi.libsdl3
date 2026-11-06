(in-package #:mfiano.lib.ffi.libsdl3)

(c:defctype properties-id :uint32)

(c:defctype display-id :uint32)

(c:defctype window-id :uint32)

(c:defctype keyboard-id :uint32)

(c:defctype mouse-id :uint32)

(c:defctype joystick-id :uint32)

(c:defctype sensor-id :uint32)

(c:defctype audio-device-id :uint32)

(c:defctype camera-id :uint32)

(c:defctype touch-id :uint64)

(c:defctype finger-id :uint64)

(c:defctype pen-id :uint32)

(c:defbitfield (init-flags :uint32)
  (:audio #x00000010)
  (:video #x00000020)
  (:joystick #x00000200)
  (:haptic #x00001000)
  (:gamepad #x00002000)
  (:events #x00004000)
  (:sensor #x00008000)
  (:camera #x00010000))

(c:defcenum scancode
  :unknown
  (:a 4)
  :b
  :c
  :d
  :e
  :f
  :g
  :h
  :i
  :j
  :k
  :l
  :m
  :n
  :o
  :p
  :q
  :r
  :s
  :t
  :u
  :v
  :w
  :x
  :y
  :z
  :1
  :2
  :3
  :4
  :5
  :6
  :7
  :8
  :9
  :0
  :return
  :escape
  :backspace
  :tab
  :space
  :minus
  :equals
  :leftbracket
  :rightbracket
  :backslash
  :nonushash
  :semicolon
  :apostrophe
  :grave
  :comma
  :period
  :slash
  :capslock
  :f1
  :f2
  :f3
  :f4
  :f5
  :f6
  :f7
  :f8
  :f9
  :f10
  :f11
  :f12
  :printscreen
  :scrolllock
  :pause
  :insert
  :home
  :pageup
  :delete
  :end
  :pagedown
  :right
  :left
  :down
  :up
  :numlockclear
  :kp-divide
  :kp-multiply
  :kp-minus
  :kp-plus
  :kp-enter
  :kp-1
  :kp-2
  :kp-3
  :kp-4
  :kp-5
  :kp-6
  :kp-7
  :kp-8
  :kp-9
  :kp-0
  :kp-period
  :nonusbackslash
  :application
  :power
  :kp-equals
  :f13
  :f14
  :f15
  :f16
  :f17
  :f18
  :f19
  :f20
  :f21
  :f22
  :f23
  :f24
  :execute
  :help
  :menu
  :select
  :stop
  :again
  :undo
  :cut
  :copy
  :paste
  :find
  :mute
  :volumeup
  :volumedown
  (:kp-comma 133)
  :kp-equalsas400
  :international1
  :international2
  :international3
  :international4
  :international5
  :international6
  :international7
  :international8
  :international9
  :lang1
  :lang2
  :lang3
  :lang4
  :lang5
  :lang6
  :lang7
  :lang8
  :lang9
  :alterase
  :sysreq
  :cancel
  :clear
  :prior
  :return2
  :separator
  :out
  :oper
  :clearagain
  :crsel
  :exsel
  :front
  (:kp-00 176)
  :kp-000
  :thousandsseparator
  :decimalseparator
  :currencyunit
  :currencysubunit
  :kp-leftparen
  :kp-rightparen
  :kp-leftbrace
  :kp-rightbrace
  :kp-tab
  :kp-backspace
  :kp-a
  :kp-b
  :kp-c
  :kp-d
  :kp-e
  :kp-f
  :kp-xor
  :kp-power
  :kp-percent
  :kp-less
  :kp-greater
  :kp-ampersand
  :kp-dblampersand
  :kp-verticalbar
  :kp-dblverticalbar
  :kp-colon
  :kp-hash
  :kp-space
  :kp-at
  :kp-exclam
  :kp-memstore
  :kp-memrecall
  :kp-memclear
  :kp-memadd
  :kp-memsubtract
  :kp-memmultiply
  :kp-memdivide
  :kp-plusminus
  :kp-clear
  :kp-clearentry
  :kp-binary
  :kp-octal
  :kp-decimal
  :kp-hexadecimal
  (:lctrl 224)
  :lshift
  :lalt
  :lgui
  :rctrl
  :rshift
  :ralt
  :rgui
  (:mode 257)
  :sleep
  :wake
  :channel-increment
  :channel-decrement
  :media-play
  :media-pause
  :media-record
  :media-fast-forward
  :media-rewind
  :media-next-track
  :media-previous-track
  :media-stop
  :media-eject
  :media-play-pause
  :media-select
  :ac-new
  :ac-open
  :ac-close
  :ac-exit
  :ac-save
  :ac-print
  :ac-properties
  :ac-search
  :ac-home
  :ac-back
  :ac-forward
  :ac-stop
  :ac-refresh
  :ac-bookmarks
  :softleft
  :softright
  :call
  :endcall
  (:reserved 400)
  (:count 512))

(c:defcenum (keycode :uint32)
  (:unknown 0)
  (:return #.(char-code #\return))
  (:escape #.(char-code #\escape))
  (:backspace #.(char-code #\backspace))
  (:tab #.(char-code #\tab))
  (:space #.(char-code #\space))
  (:exclaim #.(char-code #\!))
  (:dblapostrophe #.(char-code #\"))
  (:hash #.(char-code #\#))
  (:dollar #.(char-code #\$))
  (:percent #.(char-code #\%))
  (:ampersand #.(char-code #\&))
  (:apostrophe #.(char-code #\'))
  (:leftparen #.(char-code #\())
  (:rightparen #.(char-code #\)))
  (:asterisk #.(char-code #\*))
  (:plus #.(char-code #\+))
  (:comma #.(char-code #\,))
  (:minus #.(char-code #\-))
  (:period #.(char-code #\.))
  (:slash #.(char-code #\/))
  (:0 #.(char-code #\0))
  (:1 #.(char-code #\1))
  (:2 #.(char-code #\2))
  (:3 #.(char-code #\3))
  (:4 #.(char-code #\4))
  (:5 #.(char-code #\5))
  (:6 #.(char-code #\6))
  (:7 #.(char-code #\7))
  (:8 #.(char-code #\8))
  (:9 #.(char-code #\9))
  (:colon #.(char-code #\:))
  (:semicolon #.(char-code #\;))
  (:less #.(char-code #\<))
  (:equals #.(char-code #\=))
  (:greater #.(char-code #\>))
  (:question #.(char-code #\?))
  (:at #.(char-code #\@))
  (:leftbracket #.(char-code #\[))
  (:backslash #.(char-code #\\))
  (:rightbracket #.(char-code #\]))
  (:caret #.(char-code #\^))
  (:underscore #.(char-code #\_))
  (:grave #.(char-code #\`))
  (:a #.(char-code #\a))
  (:b #.(char-code #\b))
  (:c #.(char-code #\c))
  (:d #.(char-code #\d))
  (:e #.(char-code #\e))
  (:f #.(char-code #\f))
  (:g #.(char-code #\g))
  (:h #.(char-code #\h))
  (:i #.(char-code #\i))
  (:j #.(char-code #\j))
  (:k #.(char-code #\k))
  (:l #.(char-code #\l))
  (:m #.(char-code #\m))
  (:n #.(char-code #\n))
  (:o #.(char-code #\o))
  (:p #.(char-code #\p))
  (:q #.(char-code #\q))
  (:r #.(char-code #\r))
  (:s #.(char-code #\s))
  (:t #.(char-code #\t))
  (:u #.(char-code #\u))
  (:v #.(char-code #\v))
  (:w #.(char-code #\w))
  (:x #.(char-code #\x))
  (:y #.(char-code #\y))
  (:z #.(char-code #\z))
  (:leftbrace #.(char-code #\{))
  (:pipe #.(char-code #\|))
  (:rightbrace #.(char-code #\}))
  (:tilde #.(char-code #\~))
  (:delete #.(char-code #\delete))
  (:plusminus #x000000b1)
  (:capslock #.(scancode->keycode :capslock))
  (:f1 #.(scancode->keycode :f1))
  (:f2 #.(scancode->keycode :f2))
  (:f3 #.(scancode->keycode :f3))
  (:f4 #.(scancode->keycode :f4))
  (:f5 #.(scancode->keycode :f5))
  (:f6 #.(scancode->keycode :f6))
  (:f7 #.(scancode->keycode :f7))
  (:f8 #.(scancode->keycode :f8))
  (:f9 #.(scancode->keycode :f9))
  (:f10 #.(scancode->keycode :f10))
  (:f11 #.(scancode->keycode :f11))
  (:f12 #.(scancode->keycode :f12))
  (:printscreen #.(scancode->keycode :printscreen))
  (:scrolllock #.(scancode->keycode :scrolllock))
  (:pause #.(scancode->keycode :pause))
  (:insert #.(scancode->keycode :insert))
  (:home #.(scancode->keycode :home))
  (:pageup #.(scancode->keycode :pageup))
  (:end #.(scancode->keycode :end))
  (:pagedown #.(scancode->keycode :pagedown))
  (:right #.(scancode->keycode :right))
  (:left #.(scancode->keycode :left))
  (:down #.(scancode->keycode :down))
  (:up #.(scancode->keycode :up))
  (:numlockclear #.(scancode->keycode :numlockclear))
  (:kp-divide #.(scancode->keycode :kp-divide))
  (:kp-multiply #.(scancode->keycode :kp-multiply))
  (:kp-minus #.(scancode->keycode :kp-minus))
  (:kp-plus #.(scancode->keycode :kp-plus))
  (:kp-enter #.(scancode->keycode :kp-enter))
  (:kp-1 #.(scancode->keycode :kp-1))
  (:kp-2 #.(scancode->keycode :kp-2))
  (:kp-3 #.(scancode->keycode :kp-3))
  (:kp-4 #.(scancode->keycode :kp-4))
  (:kp-5 #.(scancode->keycode :kp-5))
  (:kp-6 #.(scancode->keycode :kp-6))
  (:kp-7 #.(scancode->keycode :kp-7))
  (:kp-8 #.(scancode->keycode :kp-8))
  (:kp-9 #.(scancode->keycode :kp-9))
  (:kp-0 #.(scancode->keycode :kp-0))
  (:kp-period #.(scancode->keycode :kp-period))
  (:application #.(scancode->keycode :application))
  (:power #.(scancode->keycode :power))
  (:kp-equals #.(scancode->keycode :kp-equals))
  (:f13 #.(scancode->keycode :f13))
  (:f14 #.(scancode->keycode :f14))
  (:f15 #.(scancode->keycode :f15))
  (:f16 #.(scancode->keycode :f16))
  (:f17 #.(scancode->keycode :f17))
  (:f18 #.(scancode->keycode :f18))
  (:f19 #.(scancode->keycode :f19))
  (:f20 #.(scancode->keycode :f20))
  (:f21 #.(scancode->keycode :f21))
  (:f22 #.(scancode->keycode :f22))
  (:f23 #.(scancode->keycode :f23))
  (:f24 #.(scancode->keycode :f24))
  (:execute #.(scancode->keycode :execute))
  (:help #.(scancode->keycode :help))
  (:menu #.(scancode->keycode :menu))
  (:select #.(scancode->keycode :select))
  (:stop #.(scancode->keycode :stop))
  (:again #.(scancode->keycode :again))
  (:undo #.(scancode->keycode :undo))
  (:cut #.(scancode->keycode :cut))
  (:copy #.(scancode->keycode :copy))
  (:paste #.(scancode->keycode :paste))
  (:find #.(scancode->keycode :find))
  (:mute #.(scancode->keycode :mute))
  (:volumeup #.(scancode->keycode :volumeup))
  (:volumedown #.(scancode->keycode :volumedown))
  (:kp-comma #.(scancode->keycode :kp-comma))
  (:kp-equalsas400 #.(scancode->keycode :kp-equalsas400))
  (:alterase #.(scancode->keycode :alterase))
  (:sysreq #.(scancode->keycode :sysreq))
  (:cancel #.(scancode->keycode :cancel))
  (:clear #.(scancode->keycode :clear))
  (:prior #.(scancode->keycode :prior))
  (:return2 #.(scancode->keycode :return2))
  (:separator #.(scancode->keycode :separator))
  (:out #.(scancode->keycode :out))
  (:oper #.(scancode->keycode :oper))
  (:clearagain #.(scancode->keycode :clearagain))
  (:crsel #.(scancode->keycode :crsel))
  (:exsel #.(scancode->keycode :exsel))
  (:front #.(scancode->keycode :front))
  (:kp-00 #.(scancode->keycode :kp-00))
  (:kp-000 #.(scancode->keycode :kp-000))
  (:thousandsseparator #.(scancode->keycode :thousandsseparator))
  (:decimalseparator #.(scancode->keycode :decimalseparator))
  (:currencyunit #.(scancode->keycode :currencyunit))
  (:currencysubunit #.(scancode->keycode :currencysubunit))
  (:kp-leftparen #.(scancode->keycode :kp-leftparen))
  (:kp-rightparen #.(scancode->keycode :kp-rightparen))
  (:kp-leftbrace #.(scancode->keycode :kp-leftbrace))
  (:kp-rightbrace #.(scancode->keycode :kp-rightbrace))
  (:kp-tab #.(scancode->keycode :kp-tab))
  (:kp-backspace #.(scancode->keycode :kp-backspace))
  (:kp-a #.(scancode->keycode :kp-a))
  (:kp-b #.(scancode->keycode :kp-b))
  (:kp-c #.(scancode->keycode :kp-c))
  (:kp-d #.(scancode->keycode :kp-d))
  (:kp-e #.(scancode->keycode :kp-e))
  (:kp-f #.(scancode->keycode :kp-f))
  (:kp-xor #.(scancode->keycode :kp-xor))
  (:kp-power #.(scancode->keycode :kp-power))
  (:kp-percent #.(scancode->keycode :kp-percent))
  (:kp-less #.(scancode->keycode :kp-less))
  (:kp-greater #.(scancode->keycode :kp-greater))
  (:kp-ampersand #.(scancode->keycode :kp-ampersand))
  (:kp-dblampersand #.(scancode->keycode :kp-dblampersand))
  (:kp-verticalbar #.(scancode->keycode :kp-verticalbar))
  (:kp-dblverticalbar #.(scancode->keycode :kp-dblverticalbar))
  (:kp-colon #.(scancode->keycode :kp-colon))
  (:kp-hash #.(scancode->keycode :kp-hash))
  (:kp-space #.(scancode->keycode :kp-space))
  (:kp-at #.(scancode->keycode :kp-at))
  (:kp-exclam #.(scancode->keycode :kp-exclam))
  (:kp-memstore #.(scancode->keycode :kp-memstore))
  (:kp-memrecall #.(scancode->keycode :kp-memrecall))
  (:kp-memclear #.(scancode->keycode :kp-memclear))
  (:kp-memadd #.(scancode->keycode :kp-memadd))
  (:kp-memsubtract #.(scancode->keycode :kp-memsubtract))
  (:kp-memmultiply #.(scancode->keycode :kp-memmultiply))
  (:kp-memdivide #.(scancode->keycode :kp-memdivide))
  (:kp-plusminus #.(scancode->keycode :kp-plusminus))
  (:kp-clear #.(scancode->keycode :kp-clear))
  (:kp-clearentry #.(scancode->keycode :kp-clearentry))
  (:kp-binary #.(scancode->keycode :kp-binary))
  (:kp-octal #.(scancode->keycode :kp-octal))
  (:kp-decimal #.(scancode->keycode :kp-decimal))
  (:kp-hexadecimal #.(scancode->keycode :kp-hexadecimal))
  (:lctrl #.(scancode->keycode :lctrl))
  (:lshift #.(scancode->keycode :lshift))
  (:lalt #.(scancode->keycode :lalt))
  (:lgui #.(scancode->keycode :lgui))
  (:rctrl #.(scancode->keycode :rctrl))
  (:rshift #.(scancode->keycode :rshift))
  (:ralt #.(scancode->keycode :ralt))
  (:rgui #.(scancode->keycode :rgui))
  (:mode #.(scancode->keycode :mode))
  (:sleep #.(scancode->keycode :sleep))
  (:wake #.(scancode->keycode :wake))
  (:channel-increment #.(scancode->keycode :channel-increment))
  (:channel-decrement #.(scancode->keycode :channel-decrement))
  (:media-play #.(scancode->keycode :media-play))
  (:media-pause #.(scancode->keycode :media-pause))
  (:media-record #.(scancode->keycode :media-record))
  (:media-fast-forward #.(scancode->keycode :media-fast-forward))
  (:media-rewind #.(scancode->keycode :media-rewind))
  (:media-next-track #.(scancode->keycode :media-next-track))
  (:media-previous-track #.(scancode->keycode :media-previous-track))
  (:media-stop #.(scancode->keycode :media-stop))
  (:media-eject #.(scancode->keycode :media-eject))
  (:media-play-pause #.(scancode->keycode :media-play-pause))
  (:media-select #.(scancode->keycode :media-select))
  (:ac-new #.(scancode->keycode :ac-new))
  (:ac-open #.(scancode->keycode :ac-open))
  (:ac-close #.(scancode->keycode :ac-close))
  (:ac-exit #.(scancode->keycode :ac-exit))
  (:ac-save #.(scancode->keycode :ac-save))
  (:ac-print #.(scancode->keycode :ac-print))
  (:ac-properties #.(scancode->keycode :ac-properties))
  (:ac-search #.(scancode->keycode :ac-search))
  (:ac-home #.(scancode->keycode :ac-home))
  (:ac-back #.(scancode->keycode :ac-back))
  (:ac-forward #.(scancode->keycode :ac-forward))
  (:ac-stop #.(scancode->keycode :ac-stop))
  (:ac-refresh #.(scancode->keycode :ac-refresh))
  (:ac-bookmarks #.(scancode->keycode :ac-bookmarks))
  (:softleft #.(scancode->keycode :softleft))
  (:softright #.(scancode->keycode :softright))
  (:call #.(scancode->keycode :call))
  (:endcall #.(scancode->keycode :endcall))
  (:left-tab #x20000001)
  (:level5-shift #x20000002)
  (:multi-key-compose #x20000003)
  (:lmeta #x20000004)
  (:rmeta #x20000005)
  (:lhyper #x20000006)
  (:rhyper #x20000007))

(c:defbitfield (keymod :uint16)
  (:none #x0000)
  (:lshift #x0001)
  (:rshift #x0002)
  (:level5 #x0004)
  (:lctrl #x0040)
  (:rctrl #x0080)
  (:lalt #x0100)
  (:ralt #x0200)
  (:lgui #x0400)
  (:rgui #x0800)
  (:num #x1000)
  (:caps #x2000)
  (:mode #x4000)
  (:scroll #x8000)
  (:ctrl #x00c0)
  (:shift #x0003)
  (:alt #x0300)
  (:gui #x0c00))

(c:defcstruct point
  (x :int)
  (y :int))

(c:defcstruct fpoint
  (x :float)
  (y :float))

(c:defcstruct rect
  (x :int)
  (y :int)
  (w :int)
  (h :int))

(c:defcstruct frect
  (x :float)
  (y :float)
  (w :float)
  (h :float))

(c:defcenum (blend-mode :uint32)
  (:none #x00000000)
  (:blend #x00000001)
  (:blend-premultiplied #x00000010)
  (:add #x00000002)
  (:add-premultiplied #x00000020)
  (:mod #x00000004)
  (:mul #x00000008)
  (:invalid #x7fffffff))

(c:defcenum pixel-type
  :unknown
  :index1
  :index4
  :index8
  :packed8
  :packed16
  :packed32
  :arrayu8
  :arrayu16
  :arrayu32
  :arrayf16
  :arrayf32
  :index2)

(c:defcenum bitmap-order
  :none
  :4321
  :1234)

(c:defcenum packed-order
  :none
  :xrgb
  :rgbx
  :argb
  :rgba
  :xbgr
  :bgrx
  :abgr
  :bgra)

(c:defcenum array-order
  :none
  :rgb
  :rgba
  :argb
  :bgr
  :bgra
  :abgr)

(c:defcenum packed-layout
  :none
  :332
  :4444
  :1555
  :5551
  :565
  :8888
  :2101010
  :1010102)

(c:defcenum (pixel-format :uint32)
  :unknown
  (:index1lsb #.(encode-pixel-format :index1 '(:4321 bitmap-order) 0 1 0))
  (:index1msb #.(encode-pixel-format :index1 '(:1234 bitmap-order) 0 1 0))
  (:index2lsb #.(encode-pixel-format :index2 '(:4321 bitmap-order) 0 2 0))
  (:index2msb #.(encode-pixel-format :index2 '(:1234 bitmap-order) 0 2 0))
  (:index4lsb #.(encode-pixel-format :index4 '(:4321 bitmap-order) 0 4 0))
  (:index4msb #.(encode-pixel-format :index4 '(:1234 bitmap-order) 0 4 0))
  (:index8 #.(encode-pixel-format :index8 0 0 8 1))
  (:rgb332 #.(encode-pixel-format :packed8 '(:xrgb packed-order) '(:332 packed-layout) 8 1))
  (:xrgb4444 #.(encode-pixel-format :packed16 '(:xrgb packed-order) '(:4444 packed-layout) 12 2))
  (:xbgr4444 #.(encode-pixel-format :packed16 '(:xbgr packed-order) '(:4444 packed-layout) 12 2))
  (:xrgb1555 #.(encode-pixel-format :packed16 '(:xrgb packed-order) '(:1555 packed-layout) 15 2))
  (:xbgr1555 #.(encode-pixel-format :packed16 '(:xbgr packed-order) '(:1555 packed-layout) 15 2))
  (:argb4444 #.(encode-pixel-format :packed16 '(:argb packed-order) '(:4444 packed-layout) 16 2))
  (:rgba4444 #.(encode-pixel-format :packed16 '(:rgba packed-order) '(:4444 packed-layout) 16 2))
  (:abgr4444 #.(encode-pixel-format :packed16 '(:abgr packed-order) '(:4444 packed-layout) 16 2))
  (:bgra4444 #.(encode-pixel-format :packed16 '(:bgra packed-order) '(:4444 packed-layout) 16 2))
  (:argb1555 #.(encode-pixel-format :packed16 '(:argb packed-order) '(:1555 packed-layout) 16 2))
  (:rgba5551 #.(encode-pixel-format :packed16 '(:rgba packed-order) '(:5551 packed-layout) 16 2))
  (:abgr1555 #.(encode-pixel-format :packed16 '(:abgr packed-order) '(:1555 packed-layout) 16 2))
  (:bgra5551 #.(encode-pixel-format :packed16 '(:bgra packed-order) '(:5551 packed-layout) 16 2))
  (:rgb565 #.(encode-pixel-format :packed16 '(:xrgb packed-order) '(:565 packed-layout) 16 2))
  (:bgr565 #.(encode-pixel-format :packed16 '(:xbgr packed-order) '(:565 packed-layout) 16 2))
  (:rgb24 #.(encode-pixel-format :arrayu8 '(:rgb array-order) 0 24 3))
  (:bgr24 #.(encode-pixel-format :arrayu8 '(:bgr array-order) 0 24 3))
  (:xrgb8888 #.(encode-pixel-format :packed32 '(:xrgb packed-order) '(:8888 packed-layout) 24 4))
  (:rgbx8888 #.(encode-pixel-format :packed32 '(:rgbx packed-order) '(:8888 packed-layout) 24 4))
  (:xbgr8888 #.(encode-pixel-format :packed32 '(:xbgr packed-order) '(:8888 packed-layout) 24 4))
  (:bgrx8888 #.(encode-pixel-format :packed32 '(:bgrx packed-order) '(:8888 packed-layout) 24 4))
  (:argb8888 #.(encode-pixel-format :packed32 '(:argb packed-order) '(:8888 packed-layout) 32 4))
  (:rgba8888 #.(encode-pixel-format :packed32 '(:rgba packed-order) '(:8888 packed-layout) 32 4))
  (:abgr8888 #.(encode-pixel-format :packed32 '(:abgr packed-order) '(:8888 packed-layout) 32 4))
  (:bgra8888 #.(encode-pixel-format :packed32 '(:bgra packed-order) '(:8888 packed-layout) 32 4))
  (:xrgb2101010
   #.(encode-pixel-format :packed32 '(:xrgb packed-order) '(:2101010 packed-layout) 32 4))
  (:xbgr2101010
   #.(encode-pixel-format :packed32 '(:xbgr packed-order) '(:2101010 packed-layout) 32 4))
  (:argb2101010
   #.(encode-pixel-format :packed32 '(:argb packed-order) '(:2101010 packed-layout) 32 4))
  (:abgr2101010
   #.(encode-pixel-format :packed32 '(:abgr packed-order) '(:2101010 packed-layout) 32 4))
  (:rgb48 #.(encode-pixel-format :arrayu16 '(:rgb array-order) 0 48 6))
  (:bgr48 #.(encode-pixel-format :arrayu16 '(:bgr array-order) 0 48 6))
  (:rgba64 #.(encode-pixel-format :arrayu16 '(:rgba array-order) 0 64 8))
  (:argb64 #.(encode-pixel-format :arrayu16 '(:argb array-order) 0 64 8))
  (:bgra64 #.(encode-pixel-format :arrayu16 '(:bgra array-order) 0 64 8))
  (:abgr64 #.(encode-pixel-format :arrayu16 '(:abgr array-order) 0 64 8))
  (:rgb48-float #.(encode-pixel-format :arrayf16 '(:rgb array-order) 0 48 6))
  (:bgr48-float #.(encode-pixel-format :arrayf16 '(:bgr array-order) 0 48 6))
  (:rgba64-float #.(encode-pixel-format :arrayf16 '(:rgba array-order) 0 64 8))
  (:argb64-float #.(encode-pixel-format :arrayf16 '(:argb array-order) 0 64 8))
  (:bgra64-float #.(encode-pixel-format :arrayf16 '(:bgra array-order) 0 64 8))
  (:abgr64-float #.(encode-pixel-format :arrayf16 '(:abgr array-order) 0 64 8))
  (:rgb96-float #.(encode-pixel-format :arrayf32 '(:rgb array-order) 0 96 12))
  (:bgr96-float #.(encode-pixel-format :arrayf32 '(:bgr array-order) 0 96 12))
  (:rgba128-float #.(encode-pixel-format :arrayf32 '(:rgba array-order) 0 128 16))
  (:argb128-float #.(encode-pixel-format :arrayf32 '(:argb array-order) 0 128 16))
  (:bgra128-float #.(encode-pixel-format :arrayf32 '(:bgra array-order) 0 128 16))
  (:abgr128-float #.(encode-pixel-format :arrayf32 '(:abgr array-order) 0 128 16))
  (:yv12 #.(encode-fourcc "YV12"))
  (:iyuv #.(encode-fourcc "IYUV"))
  (:yuy2 #.(encode-fourcc "YUY2"))
  (:uyvy #.(encode-fourcc "UYVY"))
  (:yvyu #.(encode-fourcc "YVYU"))
  (:nv12 #.(encode-fourcc "NV12"))
  (:nv21 #.(encode-fourcc "NV21"))
  (:p010 #.(encode-fourcc "P010"))
  (:external-oes #.(encode-fourcc "OES "))
  (:mjpg #.(encode-fourcc "MJPG"))
  (:rgba32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:abgr packed-order) '(:8888 packed-layout) 32 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:rgba packed-order) '(:8888 packed-layout) 32 4))
  (:argb32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:bgra packed-order) '(:8888 packed-layout) 32 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:argb packed-order) '(:8888 packed-layout) 32 4))
  (:bgra32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:argb packed-order) '(:8888 packed-layout) 32 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:bgra packed-order) '(:8888 packed-layout) 32 4))
  (:abgr32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:rgba packed-order) '(:8888 packed-layout) 32 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:abgr packed-order) '(:8888 packed-layout) 32 4))
  (:rgbx32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:xbgr packed-order) '(:8888 packed-layout) 24 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:rgbx packed-order) '(:8888 packed-layout) 24 4))
  (:xrgb32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:bgrx packed-order) '(:8888 packed-layout) 24 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:xrgb packed-order) '(:8888 packed-layout) 24 4))
  (:bgrx32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:xrgb packed-order) '(:8888 packed-layout) 24 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:bgrx packed-order) '(:8888 packed-layout) 24 4))
  (:xbgr32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:rgbx packed-order) '(:8888 packed-layout) 24 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:xbgr packed-order) '(:8888 packed-layout) 24 4)))

(c:defcstruct color
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(c:defcstruct fcolor
  (r :float)
  (g :float)
  (b :float)
  (a :float))

(c:defcstruct palette
  (ncolors :int)
  (colors (:pointer (:struct color)))
  (version :uint32)
  (refcount :int))

(c:defcstruct pixel-format-details
  (format pixel-format)
  (bits-per-pixel :uint8)
  (bytes-per-pixel :uint8)
  (padding :uint8 :count 2)
  (rmask :uint32)
  (gmask :uint32)
  (bmask :uint32)
  (amask :uint32)
  (rbits :uint8)
  (gbits :uint8)
  (bbits :uint8)
  (abits :uint8)
  (rshift :uint8)
  (gshift :uint8)
  (bshift :uint8)
  (ashift :uint8))

(c:defbitfield (surface-flags :uint32)
  (:preallocated #x00000001)
  (:lock-needed #x00000002)
  (:locked #x00000004)
  (:simd-aligned #x00000008))

(c:defcenum scale-mode
  (:invalid -1)
  :nearest
  :linear
  :pixelart)

(c:defcenum flip-mode
  :none
  :horizontal
  :vertical
  (:horizontal-and-vertical 3))

(c:defcstruct surface
  (flags surface-flags)
  (format pixel-format)
  (w :int)
  (h :int)
  (pitch :int)
  (pixels :pointer)
  (refcount :int)
  (reserved :pointer))

(c:defcstruct cursor)

(c:defbitfield (mouse-button-flags :uint32)
  (:lmask #x00000001)
  (:mmask #x00000002)
  (:rmask #x00000004)
  (:x1mask #x00000008)
  (:x2mask #x00000010))

(c:defcenum mouse-wheel-direction
  :normal
  :flipped)

(c:defcenum power-state
  (:error -1)
  :unknown
  :on-battery
  :no-battery
  :charging
  :charged)

(c:defbitfield (pen-input-flags :uint32)
  (:down #x00000001)
  (:button-1 #x00000002)
  (:button-2 #x00000004)
  (:button-3 #x00000008)
  (:button-4 #x00000010)
  (:button-5 #x00000020)
  (:eraser-tip #x40000000)
  (:in-proximity #x80000000))

(c:defcenum pen-axis
  :pressure
  :xtilt
  :ytilt
  :distance
  :rotation
  :slider
  :tangential-pressure
  :count)

(c:defcenum pen-device-type
  (:invalid -1)
  :unknown
  :direct
  :indirect)

(c:defcstruct display-mode-data)

(c:defcstruct display-mode
  (display-id display-id)
  (format pixel-format)
  (w :int)
  (h :int)
  (pixel-density :float)
  (refresh-rate :float)
  (refresh-rate-numerator :int)
  (refresh-rate-denominator :int)
  (internal (:pointer (:struct display-mode-data))))

(c:defcstruct window)

(c:defbitfield (window-flags :uint64)
  (:fullscreen #x0000000000000001)
  (:opengl #x0000000000000002)
  (:occluded #x0000000000000004)
  (:hidden #x0000000000000008)
  (:borderless #x0000000000000010)
  (:resizable #x0000000000000020)
  (:minimized #x0000000000000040)
  (:maximized #x0000000000000080)
  (:mouse-grabbed #x0000000000000100)
  (:input-focus #x0000000000000200)
  (:mouse-focus #x0000000000000400)
  (:external #x0000000000000800)
  (:modal #x0000000000001000)
  (:high-pixel-density #x0000000000002000)
  (:mouse-capture #x0000000000004000)
  (:mouse-relative-mode #x0000000000008000)
  (:always-on-top #x0000000000010000)
  (:utility #x0000000000020000)
  (:tooltip #x0000000000040000)
  (:popup-menu #x0000000000080000)
  (:keyboard-grabbed #x0000000000100000)
  (:fill-document #x0000000000200000)
  (:vulkan #x0000000010000000)
  (:metal #x0000000020000000)
  (:transparent #x0000000040000000)
  (:not-focusable #x0000000080000000))

(c:defcenum window-position
  (:undefined #x1fff0000)
  (:centered #x2fff0000))

(c:defctype gl-context :pointer)

(c:defcenum gl-attr
  :red-size
  :green-size
  :blue-size
  :alpha-size
  :buffer-size
  :doublebuffer
  :depth-size
  :stencil-size
  :accum-red-size
  :accum-green-size
  :accum-blue-size
  :accum-alpha-size
  :stereo
  :multisamplebuffers
  :multisamplesamples
  :accelerated-visual
  :retained-backing
  :context-major-version
  :context-minor-version
  :context-flags
  :context-profile-mask
  :share-with-current-context
  :framebuffer-srgb-capable
  :context-release-behavior
  :context-reset-notification
  :context-no-error
  :floatbuffers
  :egl-platform)

(c:defcenum (gl-profile :uint32)
  (:core #x00000001)
  (:compatibility #x00000002)
  (:es #x00000004))

(c:defbitfield (gl-context-flag :uint32)
  (:debug-flag #x00000001)
  (:forward-compatible-flag #x00000002)
  (:robust-access-flag #x00000004)
  (:reset-isolation-flag #x00000008))

(c:defcenum (gl-context-release-flag :uint32)
  (:none #x00000000)
  (:flush #x00000001))

(c:defcenum (gl-context-reset-notification :uint32)
  (:no-notification #x00000000)
  (:lose-context #x00000001))

(c:defcstruct renderer)

(c:defcstruct texture
  (format pixel-format)
  (w :int)
  (h :int)
  (refcount :int))

(c:defcenum texture-access
  :static
  :streaming
  :target)

(c:defcenum event-type
  :first
  (:quit #x100)
  :terminating
  :low-memory
  :will-enter-background
  :did-enter-background
  :will-enter-foreground
  :did-enter-foreground
  :locale-changed
  :system-theme-changed
  (:display-orientation #x151)
  :display-added
  :display-removed
  :display-moved
  :display-desktop-mode-changed
  :display-current-mode-changed
  :display-content-scale-changed
  :display-usable-bounds-changed
  (:window-shown #x202)
  :window-hidden
  :window-exposed
  :window-moved
  :window-resized
  :window-pixel-size-changed
  :window-metal-view-resized
  :window-minimized
  :window-maximized
  :window-restored
  :window-mouse-enter
  :window-mouse-leave
  :window-focus-gained
  :window-focus-lost
  :window-close-requested
  :window-hit-test
  :window-iccprof-changed
  :window-display-changed
  :window-display-scale-changed
  :window-safe-area-changed
  :window-occluded
  :window-enter-fullscreen
  :window-leave-fullscreen
  :window-destroyed
  :window-hdr-state-changed
  (:key-down #x300)
  :key-up
  :text-editing
  :text-input
  :keymap-changed
  :keyboard-added
  :keyboard-removed
  :text-editing-candidates
  :screen-keyboard-shown
  :screen-keyboard-hidden
  (:mouse-motion #x400)
  :mouse-button-down
  :mouse-button-up
  :mouse-wheel
  :mouse-added
  :mouse-removed
  (:joystick-axis-motion #x600)
  :joystick-ball-motion
  :joystick-hat-motion
  :joystick-button-down
  :joystick-button-up
  :joystick-added
  :joystick-removed
  :joystick-battery-updated
  :joystick-update-complete
  (:gamepad-axis-motion #x650)
  :gamepad-button-down
  :gamepad-button-up
  :gamepad-added
  :gamepad-removed
  :gamepad-remapped
  :gamepad-touchpad-down
  :gamepad-touchpad-motion
  :gamepad-touchpad-up
  :gamepad-sensor-update
  :gamepad-update-complete
  :gamepad-steam-handle-updated
  (:finger-down #x700)
  :finger-up
  :finger-motion
  :finger-canceled
  (:pinch-begin #x710)
  :pinch-update
  :pinch-end
  (:clipboard-update #x900)
  (:drop-file #x1000)
  :drop-text
  :drop-begin
  :drop-complete
  :drop-position
  (:audio-device-added #x1100)
  :audio-device-removed
  :audio-device-format-changed
  (:sensor-update #x1200)
  (:pen-proximity-in #x1300)
  :pen-proximity-out
  :pen-down
  :pen-up
  :pen-button-down
  :pen-button-up
  :pen-motion
  :pen-axis
  (:camera-device-added #x1400)
  :camera-device-removed
  :camera-device-approved
  :camera-device-denied
  (:render-targets-reset #x2000)
  :render-device-reset
  :render-device-lost
  (:private0 #x4000)
  :private1
  :private2
  :private3
  (:poll-sentinel #x7f00)
  (:user #x8000)
  (:last #xffff)
  (:enum-padding #x7fffffff))

(c:defcstruct common-event
  (type :uint32)
  (reserved :uint32)
  (timestamp :uint64))

(c:defcstruct display-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (display-id display-id)
  (data1 :int32)
  (data2 :int32))

(c:defcstruct window-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (data1 :int32)
  (data2 :int32))

(c:defcstruct keyboard-device-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which keyboard-id))

(c:defcstruct keyboard-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (which keyboard-id)
  (scancode scancode)
  (key keycode)
  (mod keymod)
  (raw :uint16)
  (down :bool)
  (repeat :bool))

(c:defcstruct text-editing-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (text :string)
  (start :int32)
  (length :int32))

(c:defcstruct text-editing-candidates-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (candidates (:pointer :pointer))
  (num-candidates :int32)
  (selected-candidate :int32)
  (horizontal :bool)
  (padding1 :uint8)
  (padding2 :uint8)
  (padding3 :uint8))

(c:defcstruct text-input-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (text :string))

(c:defcstruct mouse-device-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which mouse-id))

(c:defcstruct mouse-motion-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (which mouse-id)
  (state mouse-button-flags)
  (x :float)
  (y :float)
  (xrel :float)
  (yrel :float))

(c:defcstruct mouse-button-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (which mouse-id)
  (button :uint8)
  (down :bool)
  (clicks :uint8)
  (padding :uint8)
  (x :float)
  (y :float))

(c:defcstruct mouse-wheel-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (which mouse-id)
  (x :float)
  (y :float)
  (direction mouse-wheel-direction)
  (mouse-x :float)
  (mouse-y :float)
  (integer-x :int32)
  (integer-y :int32))

(c:defcstruct joy-axis-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id)
  (axis :uint8)
  (padding1 :uint8)
  (padding2 :uint8)
  (padding3 :uint8)
  (value :int16)
  (padding4 :uint16))

(c:defcstruct joy-ball-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id)
  (ball :uint8)
  (padding1 :uint8)
  (padding2 :uint8)
  (padding3 :uint8)
  (xrel :int16)
  (yrel :int16))

(c:defcstruct joy-hat-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id)
  (hat :uint8)
  (value :uint8)
  (padding1 :uint8)
  (padding2 :uint8))

(c:defcstruct joy-button-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id)
  (button :uint8)
  (down :bool)
  (padding1 :uint8)
  (padding2 :uint8))

(c:defcstruct joy-device-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id))

(c:defcstruct joy-battery-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id)
  (state power-state)
  (percent :int))

(c:defcstruct gamepad-axis-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id)
  (axis :uint8)
  (padding1 :uint8)
  (padding2 :uint8)
  (padding3 :uint8)
  (value :int16)
  (padding4 :uint16))

(c:defcstruct gamepad-button-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id)
  (button :uint8)
  (down :bool)
  (padding1 :uint8)
  (padding2 :uint8))

(c:defcstruct gamepad-device-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id))

(c:defcstruct gamepad-touchpad-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id)
  (touchpad :int32)
  (finger :int32)
  (x :float)
  (y :float)
  (pressure :float))

(c:defcstruct gamepad-sensor-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which joystick-id)
  (sensor :int32)
  (data :float :count 3)
  (sensor-timestamp :uint64))

(c:defcstruct audio-device-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which audio-device-id)
  (recording :bool)
  (padding1 :uint8)
  (padding2 :uint8)
  (padding3 :uint8))

(c:defcstruct camera-device-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which camera-id))

(c:defcstruct render-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id))

(c:defcstruct touch-finger-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (touch-id touch-id)
  (finger-id finger-id)
  (x :float)
  (y :float)
  (dx :float)
  (dy :float)
  (pressure :float)
  (window-id window-id))

(c:defcstruct pinch-finger-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (scale :float)
  (window-id window-id))

(c:defcstruct pen-proximity-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (which pen-id)
  (pen-state pen-input-flags)
  (device-type pen-device-type))

(c:defcstruct pen-motion-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (which pen-id)
  (pen-state pen-input-flags)
  (x :float)
  (y :float)
  (device-type pen-device-type))

(c:defcstruct pen-touch-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (which pen-id)
  (pen-state pen-input-flags)
  (x :float)
  (y :float)
  (eraser :bool)
  (down :bool)
  (device-type pen-device-type))

(c:defcstruct pen-button-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (which pen-id)
  (pen-state pen-input-flags)
  (x :float)
  (y :float)
  (button :uint8)
  (down :bool)
  (device-type pen-device-type))

(c:defcstruct pen-axis-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (which pen-id)
  (pen-state pen-input-flags)
  (x :float)
  (y :float)
  (axis pen-axis)
  (value :float)
  (device-type pen-device-type))

(c:defcstruct drop-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (x :float)
  (y :float)
  (source :string)
  (data :string))

(c:defcstruct clipboard-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (owner :bool)
  (num-mime-types :int32)
  (mime-types (:pointer :pointer)))

(c:defcstruct sensor-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64)
  (which sensor-id)
  (data :float :count 6)
  (sensor-timestamp :uint64))

(c:defcstruct quit-event
  (type event-type)
  (reserved :uint32)
  (timestamp :uint64))

(c:defcstruct user-event
  (type :uint32)
  (reserved :uint32)
  (timestamp :uint64)
  (window-id window-id)
  (code :int32)
  (data1 :pointer)
  (data2 :pointer))

(c:defcunion event
  (type :uint32)
  (common (:struct common-event))
  (display (:struct display-event))
  (window (:struct window-event))
  (kdevice (:struct keyboard-device-event))
  (key (:struct keyboard-event))
  (edit (:struct text-editing-event))
  (edit-candidates (:struct text-editing-candidates-event))
  (text (:struct text-input-event))
  (mdevice (:struct mouse-device-event))
  (motion (:struct mouse-motion-event))
  (button (:struct mouse-button-event))
  (wheel (:struct mouse-wheel-event))
  (jdevice (:struct joy-device-event))
  (jaxis (:struct joy-axis-event))
  (jball (:struct joy-ball-event))
  (jhat (:struct joy-hat-event))
  (jbutton (:struct joy-button-event))
  (jbattery (:struct joy-battery-event))
  (gdevice (:struct gamepad-device-event))
  (gaxis (:struct gamepad-axis-event))
  (gbutton (:struct gamepad-button-event))
  (gtouchpad (:struct gamepad-touchpad-event))
  (gsensor (:struct gamepad-sensor-event))
  (adevice (:struct audio-device-event))
  (cdevice (:struct camera-device-event))
  (sensor (:struct sensor-event))
  (quit (:struct quit-event))
  (user (:struct user-event))
  (tfinger (:struct touch-finger-event))
  (pinch (:struct pinch-finger-event))
  (pproximity (:struct pen-proximity-event))
  (ptouch (:struct pen-touch-event))
  (pmotion (:struct pen-motion-event))
  (pbutton (:struct pen-button-event))
  (paxis (:struct pen-axis-event))
  (render (:struct render-event))
  (drop (:struct drop-event))
  (clipboard (:struct clipboard-event))
  (padding :uint8 :count 128))
