;; Jump between windows using arrows
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Use simpler shortcuts to resize windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Avy
;; Jump to another visible location
(use-package avy
  :bind (("C-ò" . avy-goto-word-1)
	 ("M-ò" . avy-resume)))

(provide 'ap-movement)
