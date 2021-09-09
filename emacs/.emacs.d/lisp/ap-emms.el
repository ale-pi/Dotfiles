;; EMMS
;; Emacs Multi Media System

(defun ap/emms-playlist-mode-setup ()
  (display-line-numbers-mode))

(use-package emms
  :config
  (require 'emms-setup)
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/Musica/")
  :hook ((emms-browser-mode . hl-line-mode)
	 (emms-playlist-mode . ap/emms-playlist-mode-setup)))

(provide 'ap-emms)
