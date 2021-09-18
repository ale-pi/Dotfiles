(use-package smartparens
  :hook ((emacs-lisp-mode . smartparens-mode)
	 (geiser-repl-mode . smartparens-mode)
	 (scheme-mode . smartparens-mode)))

;; Guile
(use-package geiser)
(use-package geiser-guile
  :config
  (setq geiser-guile-binary "guile2.2"))

(provide 'ap-lang-lisp)
