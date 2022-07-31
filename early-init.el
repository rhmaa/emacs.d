;;; early-init.el --- Early initialisation -*- lexical-binding:t -*-

;; Increase the garbage collection threshold for faster startup.
(setq gc-cons-threshold (* 50 1000 1000))

;; Disable graphical elements immediately to prevent flickering.
(set-fringe-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

;; Maximise the frame when its opened.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(load (concat user-emacs-directory "lisp/faces.el"))

(set-face-attribute 'default nil
                    :foreground "#bebebe"
                    :background "#000000")

;;; early-init.el ends here
