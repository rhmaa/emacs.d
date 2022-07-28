;;; packages.el --- External packages -*- lexical-binding:t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(when (< emacs-major-version 27)
  (package-initialize))
(unless package-archive-contents
  (package-refresh-contents))

(defvar rha/required-packages
  '(markdown-mode go-mode rust-mode magit auto-complete)
  "List of packages that should always be installed.")
(dolist (pkg rha/required-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Make sure that the packages know where our bin folders are.
(defun rha/append-to-path (path)
  "Add a path both to the $PATH variable and to `exec-path'."
  (setenv "PATH" (concat (getenv "PATH") ":" path))
  (add-to-list 'exec-path path))

(unless (eq system-type 'windows-nt)
  (rha/append-to-path "/usr/local/bin"))

;; Use markdown-mode when editing Markdown files.
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown'" . markdown-mode))
(setq markdown-command "multimarkdown")

(require 'magit)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)

;;; packages.el ends here
