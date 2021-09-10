;; Org-mode
;; Outline-based note manager and organizer

;; Setup fonts for org-mode
(defun ap/org-fonts-setup ()
  (dolist (face org-level-faces)
    (set-face-attribute face nil :font "DejaVu Sans" :weight 'bold :height 120))
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch)
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))))))

;; Center text when in org-mode
(defun ap/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

;; Org-mode hook
(defun ap/org-mode-setup ()
  (ap/org-mode-visual-fill)
  (hl-line-mode -1)
  (display-line-numbers-mode -1)
  (org-bullets-mode 1)
  (org-indent-mode)
  (variable-pitch-mode 1)
  (setq-local cursor-type 'bar)
  (visual-line-mode 1))

(use-package visual-fill-column)

(use-package org-bullets)

(use-package org
  :commands org-capture
  :config
  (ap/org-fonts-setup)
  (setq org-ellipsis " ▼")
  (setq org-export-with-toc nil)
  (setq org-goto-auto-isearch nil)
  (setq org-directory (expand-file-name "~/Org/TODOS/"))
  ;; Org-capture
  (setq org-capture-templates
	'(("b" "Books")
	  ("be" "Essays" entry
	   (file+headline "books.org" "Essays")
	   "* %^{Title} %?\n - *author:* \n - *publisher:* \n - *keywords:* ")
	  ("bn" "Narrative books" entry
	   (file+headline "books.org" "Narrative")
	   "* %^{Title} %?\n - *author:* \n - *publisher:* \n - *keywords:* ")
	  ("bt" "Technical books" entry
	   (file+headline "books.org" "Technical")
	   "* %^{Title} %?\n - *author:* \n - *publisher:* \n - *keywords:* ")
	  ("m" "Movies" table-line
	   (file "movies.org")
	   "| %^{Title} | %^{Director} | %^{Genre} | %^{Keywords} |")))
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  :hook (org-mode . ap/org-mode-setup))

(provide 'ap-org)
