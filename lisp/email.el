;;; email.el --- Email configurations -*- lexical-binding:t -*-

(require 'rmail)
(require 'smtpmail)

;;; User Information:

(setq user-full-name "Rikard Hevosmaa"
      user-mail-address "rikard@posteo.se")

;;; Receive Messages:

(setq rmail-file-name "~/.emacs.d/rmail/rmail.mbox"
      rmail-primary-inbox-list
      '("imap://r.hevosmaa%40posteo.net@posteo.de:143")
      rmail-remote-password-required t)

;; Use the movemail variant provided by GNU Mailutils.
(setq rmail-movemail-program "/usr/local/bin/movemail"
      rmail-movemail-variant-in-use 'mailutils)

;;; Send Messages:

(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "posteo.de"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 587
      smtpmail-auth-credentials '("posteo.de" 587 nil nil)
      smtpmail-starttls-credentials '("posteo.de" 587 nil nil)
      starttls-use-gnutls nil)

(setq message-signature-file "~/.emacs.d/rmail/signature")

;;; Reading Messages:

(setq rmail-summary-window-size 16)

(defun rha/rmail-archive ()
  "Archive the current message."
  (interactive)
  (rmail-output "~/.emacs.d/rmail/archive.mbox")
  (rmail-delete-forward))

(add-hook 'rmail-summary-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-a") 'rha/rmail-archive)))
