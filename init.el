;;; init.el --- Emacs initialisation file -*- lexical-binding:t -*-

;; Copyright (C) 2014-2019 Rikard Hevosmaa

;; Use of this source code is governed by the GNU General Public License
;; version 3 or later, which can be found in the LICENSE file.

(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  (set-frame-size (selected-frame) 82 64))

;; Disable the menu bar in text consoles.
(unless (display-graphic-p)
  (menu-bar-mode 0))

;; Load submodules.
(load "~/.emacs.d/lisp/packages.el")
(load "~/.emacs.d/lisp/faces.el")
(load "~/.emacs.d/lisp/keybindings.el")
(load "~/.emacs.d/lisp/misc.el")

;; Nowadays I use Apple mail for emails.
;; (load "~/.emacs.d/lisp/email.el")
