(load-theme 'tango-dark)
(column-number-mode 1)

(setq make-backup-files nil
      inhibit-startup-screen t)

(global-set-key [f5] 'compile)
(global-set-key [f6] 'shell)

;; do not use tab indent
(setq-default default-tab-width 4
              tab-width 4
              indent-tabs-mode nil)

;; do not truncate lines by default
;; truncate lines in specific modes
(defun hook-truncate-lines ()
  (setq truncate-lines t))
(add-hook 'c-mode-common-hook 'hook-truncate-lines)
(add-hook 'dired-mode-hook 'hook-truncate-lines)
(add-hook 'python-mode-hook 'hook-truncate-lines)

;; move the window to upper left corner
(set-frame-position (frame-focus) 10 40)
