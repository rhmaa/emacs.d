;;; init.el --- Top-level initialisation -*- lexical-binding:t -*-

;;; Copyright (C) 2013-2022 Rikard Hevosmaa

;;; Use of this source code is governed by the GNU General Public License
;;; version 3 or later, which can be found in the LICENSE file.

;; Echo `emacs-init-time' in the minibuffer on startup.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message (concat "Emacs initialised in " (emacs-init-time)))))

;; Specify the default directory beneath which additional initialisation
;; files are placed. Use the XDesktop standard on Linux; use the Emacs
;; default on all other systems.
(if (eq system-type 'gnu/linux)
    (setq user-emacs-directory "~/.config/emacs/")
  (setq user-emacs-directory "~/.emacs.d/"))

;; Load modules.
(load (concat user-emacs-directory "lisp/packages.el"))
(load (concat user-emacs-directory "lisp/faces.el"))
(load (concat user-emacs-directory "lisp/keys.el"))
(load (concat user-emacs-directory "lisp/misc.el"))

;;; init.el ends here
