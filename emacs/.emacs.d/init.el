;; Load stuff

;; Startup performance

(setq gc-cons-threshold (* 50 1000 1000))

(defun ap/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'ap/display-startup-time)

;; Backup

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
(setq backup-by-copying t)
(setq version-control t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)

;; Custom
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Load modules

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'ap-elpa)
(require 'ap-movement)
(require 'ap-dired)
(require 'ap-ui)
(require 'ap-org)
(require 'ap-completion)
(require 'ap-dev)
(require 'ap-lang-lisp)
(require 'ap-lang-lisp)
(require 'ap-lang-python)
(require 'ap-emms)
(require 'ap-eshell)
