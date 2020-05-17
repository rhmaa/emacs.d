;;; packages.el --- External packages -*- lexical-binding:t -*-

(require 'package)

;; Use unsafe connection on Windows.
(let* ((no-ssl (and (eq system-type 'windows-nt)
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives
	       (cons "melpa" (concat proto "://melpa.org/packages/")) t))

;; Use SSL on Mac and Linux.
(when (not (eq system-type 'windows-nt))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(package-initialize)
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
