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

;; Specify default directory for the initialisation files.
;; Use the XDG standard directory on Linux, use the Emacs default on
;; all other system.
(defvar rha/default-directory nil
  "The default directory for Emacs' initialisation files.")
(if (eq system-type 'gnu/linux)
    (setq rha/default-directory "~/.config/emacs")
  (setq rha/default-directory "~/.emacs.d"))

;; Load modules.
(load (concat rha/default-directory "/lisp/packages.el"))
(load (concat rha/default-directory "/lisp/faces.el"))
(load (concat rha/default-directory "/lisp/keys.el"))
(load (concat rha/default-directory "/lisp/misc.el"))
