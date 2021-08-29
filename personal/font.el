;; Only set font in GUI mode.

(if (display-graphic-p)
    (progn
      ;; Setting English Font
      (set-face-attribute
       'default nil :font "JetBrains Mono 14")

      ;; Chinese Font
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
                          charset
                          (font-spec :family "Microsoft YaHei" :size 18)))
    )
)

;; 字体测试 Abc 混用 moew 中 Meow 英
