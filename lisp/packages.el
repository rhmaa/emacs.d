;;; packages.el --- External packages -*- lexical-binding:t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(unless package-archive-contents
  (package-refresh-contents))

(setq rha-packages
      '(go-mode markdown-mode auto-complete auctex
                magit dash lv transient with-editor))
(dolist (pkg rha-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(require 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown'" . markdown-mode))
(setq markdown-command "markdown")

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))
