(use-package tex
  :ensure auctex
  :config
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-engine 'xetex
        LaTeX-command-style '(("" "%(PDF)%(latex) -shell-escape %(file-line-error) %(extraopts) %S%(PDFout)"))
  )
)
