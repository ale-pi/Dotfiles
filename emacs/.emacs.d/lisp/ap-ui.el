;; Disable menu bar, scroll bar, tool bar and startup screen
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

;; Display line numbers and highlight current line
(global-display-line-numbers-mode)
(global-hl-line-mode)

(defun ap/moody-theme-setup (color)
  (let ((line (face-attribute 'mode-line :underline)))
    (set-face-attribute 'mode-line          nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :underline  line)
    (set-face-attribute 'mode-line          nil :box        nil)
    (set-face-attribute 'mode-line-inactive nil :box        nil)
    (set-face-attribute 'mode-line-inactive nil :background color)))

(defun ap/switch-theme ()
  (interactive)
  (if (eq (car custom-enabled-themes) 'sanityinc-tomorrow-night)
      (progn
	(disable-theme 'sanityinc-tomorrow-night)
	(load-theme 'sanityinc-tomorrow-day t)
	(ap/moody-theme-setup "#ffffff")
	(ap/org-fonts-setup)
	(message "Loaded light theme"))
    (progn
      (disable-theme 'sanityinc-tomorrow-day)
      (load-theme 'sanityinc-tomorrow-night t)
      (ap/moody-theme-setup "#1d1f21")
      (ap/org-fonts-setup)
      (message "Loaded dark theme"))))

(use-package color-theme-sanityinc-tomorrow
  :config
  (load-theme 'sanityinc-tomorrow-night t)
  (ap/moody-theme-setup "#1d1f21")
  (global-set-key (kbd "<f5>") 'ap/switch-theme))

  
;; Modeline configuration

(use-package minions
  :config
  (setq minions-mode-line-lighter "~")
  (minions-mode 1))

(use-package moody
  :init
  (setq display-time-24hr-format t)
  (setq display-time-default-load-average nil)
  (display-time-mode 1)
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (setq moody-mode-line-height 24))

;; Font configuration
(set-face-attribute 'default nil :font "Monoisome" :height 110)
(set-face-attribute 'fixed-pitch nil :font "Monoisome" :height 110)
(set-face-attribute 'variable-pitch nil :font "DejaVu Sans" :height 130)
(set-fontset-font t 'symbol (font-spec :family "Noto Color Emoji"))
(set-fontset-font t nil (font-spec :size 20 :name "Symbola"))
(global-set-key (kbd "C-c +") 'text-scale-increase)
(global-set-key (kbd "C-c -") 'text-scale-decrease)

(provide 'ap-ui)
