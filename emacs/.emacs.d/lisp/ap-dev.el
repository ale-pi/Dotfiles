;; Magit
;; Git client
(use-package magit)

;; Eglot
;; LSP integration for emacs
(use-package eglot
  :hook ((c-mode . eglot-ensure)
	 (c++-mode . eglot-ensure)
	 (python-mode . eglot-ensure)))

;; Markdown-mode
(use-package markdown-mode)

;; Yaml-mode
(use-package yaml-mode)

;; Yasnippet
;; Snippet collection
(use-package yasnippet-snippets)
(use-package yasnippet
  :config
  (yas-global-mode 1))

;; Smartparens
;; Minor mode to deal with pairs
(use-package smartparens
  :hook ((c-mode . smartparens-mode)
	 (c++-mode . smartparens-mode)
	 (emacs-lisp-mode . smartparens-mode)
	 (python-mode . smartparens-mode)
	 (scheme-mode . smartparens-mode)
	 (geiser-repl-mode . smartparens-mode)
	 (smartparens-mode . show-smartparens-mode)))

;; Guile
(use-package geiser)
(use-package geiser-guile
  :config
  (setq geiser-guile-binary "guile2.2"))

;; Project
;; Project management tool
(defun ap/project-magit-status ()
  "Run `magit-status' on project."
  (interactive)
  (let* ((pr (project-current t))
         (dir (cdr pr)))
    (magit-status dir)))

(use-package project
  :bind
  ("C-x p m" . ap/project-magit-status)
  :config
  (setq project-switch-commands '((project-find-file "Find file" nil)
				  (project-find-regexp "Find regexp" nil)
				  (project-dired "Dired" nil)
				  (project-eshell "Eshell" nil)
				  (ap/project-magit-status "Magit" nil))))
(provide 'ap-dev)
