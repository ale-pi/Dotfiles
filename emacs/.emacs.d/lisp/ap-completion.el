;; Which-key
;; Show suggestions when typing an incomplete binding in the minibuffer
(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom))

;; Vertico
;; Completion UI for the minibuffer
(use-package vertico
  :config
  (vertico-mode)
  (setq vertico-cycle t))

;; Orderless
;; Completion method
(use-package orderless
  :config
  (setq completion-styles '(orderless))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides '((file (styles partial-completion)))))

;; Consult
;; Completion scripts

(use-package consult
  :bind
  ;; Buffers
  ("C-x b" . consult-buffer)
  ("C-x C-b" . consult-buffer-other-window)
  ;; Editing and navigation
  ("C-c h" . consult-imenu)
  ("C-s" . consult-line)
  ("M-y" . consult-yank-pop)
  ;; Grep and find files
  ("C-c g" . consult-ripgrep)
  ("C-c f" . consult-find)
  ;; Ide-like stuff
  ("C-c m" . consult-flymake)
  ;; TODO add xref when you understand what it's used for
  ;; Org-mode
  (:map org-mode-map
	("C-c h" . consult-org-heading)
	("C-c a" . consult-org-agenda))
  :config
  (setq consult-project-root-function
        (lambda ()
          (when-let (project (project-current))
            (car (project-roots project))))))

;; Marginalia
;; Info next to entries in minibuffer
(use-package marginalia
  :config
  (marginalia-mode))

;; Savehist
;; Show recently selected elements at top
(use-package savehist
  :init
  (savehist-mode))

;; Embark
;; Context menu in the minibuffer
(use-package embark
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  (setq embark-quit-after-action nil)
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none))))
  ;; make embark commands be visible from which-key
  (setq embark-action-indicator
	(lambda (map _target)
          (which-key--show-keymap "Embark" map nil nil 'no-paging)
          #'which-key--hide-popup-ignore-command)
	embark-become-indicator embark-action-indicator)
  :bind (("C-." . embark-act)
	 ("M-." . embark-dwim)
	 ("C-h B" . embark-bindings)))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t
  :hook (embark-collect-mode . consult-preview-at-point-mode))

;; Company
;; In-buffer completion via dropdown menu
(use-package company
  :hook (after-init . global-company-mode)
  :bind ("C-c c" . company-complete))

(provide 'ap-completion)
