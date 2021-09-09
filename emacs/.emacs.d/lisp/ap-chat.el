(defun ap/chat-modes-setup ()
  (display-line-numbers-mode -1))

;; ERC
;; Emacs IRC client
(use-package erc
  :hook (erc-mode . ap/chat-modes-setup)
  :config
  (setq erc-server "irc.libera.chat")
  (setq erc-nick "ale-pi")
  (setq erc-user-full-name "Alessandro Perlo")
  (setq erc-kill-buffer-on-part t)
  (setq erc-auto-query 'bury))

;; Telega
;; Emacs Telegram client
;; (use-package telega
;;   :hook ((telega-chat-mode . ap/chat-modes-setup)
;;       (telega-root-mode . ap/chat-modes-setup))
;;  :bind-keymap ("C-c t" . telega-prefix-map))

(provide 'ap-chat)
