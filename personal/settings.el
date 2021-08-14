(load-theme 'tango-dark)
(column-number-mode 1)

(setq make-backup-files nil
      inhibit-startup-screen t)

(global-set-key [f5] 'compile)
(global-set-key [f6] 'shell)

;; truncate lines by default
(setq-default truncate-lines t
              default-tab-width 4
              tab-width 4
              indent-tabs-mode nil)
(defun hook-do-not-truncate-lines ()
  (setq truncate-lines nil))
(add-hook 'org-mode-hook 'hook-do-not-truncate-lines)
(add-hook 'text-mode-hook 'hook-do-not-truncate-lines)
