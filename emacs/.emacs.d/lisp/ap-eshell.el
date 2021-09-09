(defun ap/eshell-setup ()
  (display-line-numbers-mode 0)
  (setq-local global-hl-line-mode nil))

(defun ap/eshell-complete-history ()
  (interactive)
  (let ((hist (ring-elements eshell-history-ring)))
    (insert
     (completing-read "Input from history: " hist nil t))))

(use-package eshell
  :hook (eshell-mode . ap/eshell-setup)
  :config
  (setq eshell-hist-ignoredups t)
  (setq eshell-scroll-to-bottom-on-input t))

(use-package eshell-git-prompt
  :ensure t
  :config
  (eshell-git-prompt-use-theme 'git-radar))

(use-package eshell-syntax-highlighting
  :after esh-mode
  :config
  (eshell-syntax-highlighting-global-mode +1))

(provide 'ap-eshell)
