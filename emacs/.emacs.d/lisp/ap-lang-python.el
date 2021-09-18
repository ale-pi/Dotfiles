(provide 'ap-lang-python)

;; Setup the python-language-server LSP server
(use-package eglot
  :hook (python-mode . eglot-ensure))

;; Enable smartparens
(use-package smartparens
  :hook (python-mode . smartparens-mode))
