(setq python3-path "/usr/bin")

(defun my-python-mode-config ()
  (setq python-shell-interpreter (concat python3-path "/python3")
        python-shell-completion-native-enable nil
        py-python-command (concat python3-path "/python3")
        exec-path (append exec-path '(python3-path))
        python-shell-completion-native-disabled-interpreters '("python"))
)

(add-hook 'python-mode-hook 'my-python-mode-config)

(use-package elpy
  :ensure t
  :config (setq elpy-rpc-python-command "python3"
                tab-width 4)
  :hook (python-mode . elpy-enable))

(use-package flycheck
  :ensure t
  :hook (python-mode . flycheck-mode))
