;;; init.el --- Emacs initialisation file -*- lexical-binding:t -*-

;; Copyright (C) 2013-2022 Rikard Hevosmaa

;; Use of this source code is governed by the GNU General Public License
;; version 3 or later, which can be found in the LICENSE file.

(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

;; Disable the menu bar in text consoles.
(unless (display-graphic-p)
  (menu-bar-mode 0))

;; Load modules.
(load "~/.emacs.d/lisp/packages.el")
(load "~/.emacs.d/lisp/faces.el")
(load "~/.emacs.d/lisp/keys.el")
(load "~/.emacs.d/lisp/misc.el")
