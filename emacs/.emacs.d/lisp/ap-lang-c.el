;; Setup the clang language server
(use-package eglot
  :hook ((c-mode . eglot-ensure)
	 (c++-mode . eglot-ensure)))

;; Enable smartparens
(use-package smartparens
  :hook ((c-mode . smartparens-mode)
	 (c++-mode . smartparens-mode)))

(provide 'ap-lang-c)
