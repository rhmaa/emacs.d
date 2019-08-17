;;; packages.el --- External packages -*- lexical-binding:t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(unless package-archive-contents
  (package-refresh-contents))

(setq rha-packages
      '(go-mode markdown-mode slime auto-complete auctex))
(dolist (pkg rha-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(require 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown'" . markdown-mode))
(setq markdown-command "multimarkdown")

(require 'slime)
(setq slime-contribs '(slime-fancy)
      slime-default-lisp 'sbcl
      slime-net-coding-system 'utf-8-unix)

(defun prelude-start-slime ()
  (unless (slime-connected-p)
    (save-excursion (slime))))
(add-hook 'slime-mode-hook 'prelude-start-slime)

(eval-after-load "slime"
  '(progn
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol
           slime-fuzzy-completion-in-place t
           slime-enable-evaluate-in-emacs t
           slime-autodoc-use-multiline-p t)))

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
