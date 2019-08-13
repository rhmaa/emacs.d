;;; email.el --- Email configurations -*- lexical-binding:t -*-

(require 'rmail)
(require 'smtpmail)

;;; Receive Messages:

(setq rmail-file-name "~/.emacs.d/rmail/rmail.mbox"
      rmail-primary-inbox-list
      '("imap://r.hevosmaa%40posteo.net@posteo.de:143")
      rmail-remote-password-required t)

;; Use the movemail variant provided by GNU Mailutils.
(setq rmail-movemail-program "/usr/local/bin/movemail"
      rmail-movemail-variant-in-use 'mailutils)

;;; Send Messages:

(setq user-full-name "Rikard Hevosmaa"
      user-mail-address "rikard@posteo.se")

(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "posteo.de"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 587
      smtpmail-auth-credentials '("posteo.de" 587 nil nil)
      smtpmail-starttls-credentials '("posteo.de" 587 nil nil)
      starttls-use-gnutls nil)
