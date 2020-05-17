;;; misc.el --- Miscellaneous configurations -*- lexical-binding:t -*-

(setenv "LC_ALL" "en_GB.UTF-8")

;; Disable most welcome messages.
(setq inhibit-startup-screen t
      initial-scratch-message nil)

;; Automatically insert end braces.
(add-hook 'prog-mode-hook 'electric-pair-mode)

;; Use Allman style indentation for C.
(setq-default c-default-style "bsd"
              c-basic-offset 4
	      indent-tabs-mode nil)

;; `eshell' related functions.
(defun rha/open-eshell ()
  "Open `eshell' in a new window below the selected window."
  (interactive)
  (split-window-below)
  (windmove-down)
  (set-window-text-height (selected-window) 24)
  (eshell))

(add-hook 'eshell-exit-hook
          (lambda ()
            (when (not (one-window-p))
              (delete-window))))

;; Keep `custom-set-variables' out of `init.el'.
(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)

;; Create temporary files in the system's temporary file directory.
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(column-number-mode 1)              ; Display column number in the mode line
(delete-selection-mode 1)           ; Overwrite region
(set-fringe-mode 0)                 ; Disable fringes
(fset 'yes-or-no-p 'y-or-n-p)       ; Enable shorter answers
(setq confirm-kill-emacs 'y-or-n-p  ; Enable confirm on exit
      ring-bell-function 'ignore)   ; Disable the alarm bell

;; Org mode.
(setq org-log-done 'time)
(add-hook 'org-mode-hook 'auto-fill-mode)
