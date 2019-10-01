;;; packages.el --- External packages -*- lexical-binding:t -*-

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(unless package-archive-contents
  (package-refresh-contents))

;; Make sure that certain packages are always installed.
(setq rha/packages '(markdown-mode))
(dolist (pkg rha/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Make sure that the packages know where our bin folders are.
(defun rha/append-to-path (path)
  "Add a path both to the $PATH variable and to Emacs' exec-path."
  (setenv "PATH" (concat (getenv "PATH") ":" path))
  (add-to-list 'exec-path path))

(rha/append-to-path "/usr/local/bin")

;; Use markdown-mode when editing Markdown files.
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown'" . markdown-mode))
(setq markdown-command "multimarkdown")
