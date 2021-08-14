;; load all el-files in ./personal
(let '(my-personal-dir "~/.emacs.d/personal")
  (when (file-exists-p my-personal-dir)
    (mapc 'load (directory-files my-personal-dir 't "^[^#\.].*\\.el$"))))
