;;; 先设置外观，再设置行为

;; 移动窗口至左上角
(set-frame-position (frame-focus) 10 40)
(load-theme 'tango-dark)

;;; -------- 设置字体 --------
;; 仅在 GUI mode 下设置字体。

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

;;; -------- 全局模式设置 --------

(column-number-mode 1)
(show-paren-mode 1)

(setq make-backup-files nil
      inhibit-startup-screen t)

(global-set-key [f5] 'compile)
(global-set-key [f6] 'shell)

;; 禁用 Tab 缩进
(setq-default default-tab-width 4
              tab-width 4
              indent-tabs-mode nil)

;; Do not truncate lines by default.
;; Truncate lines in specific modes.
(defun hook-truncate-lines ()
  (setq truncate-lines t))
(add-hook 'c-mode-common-hook 'hook-truncate-lines)
(add-hook 'python-mode-hook 'hook-truncate-lines)
(add-hook 'dired-mode-hook 'hook-truncate-lines)

;;; -------- Better Defaults --------

;; remove useless parts
(unless (eq window-system 'ns)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

;; configure zap-up-to-char
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)

;; change buffer name to xx/yy if collide
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; save cursor position when close file
;; https://www.emacswiki.org/emacs/SavePlace
(save-place-mode 1)

;; key bindings
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(setq save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain
      custom-file (expand-file-name "~/.emacs.d/custom.el"))

;; load custom file
(when (file-exists-p custom-file)
  (load custom-file))

;;; -------- Always UTF-8 --------

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
(setq-default buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
