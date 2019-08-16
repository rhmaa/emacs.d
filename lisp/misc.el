;;; misc.el --- Miscellaneous configurations -*- lexical-binding:t -*-

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))

;; Use SBCL for Common Lisp.
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; Disable most welcome messages.
(setq inhibit-startup-screen t
      initial-scratch-message nil)

;; Show line numbers in prog-mode.
(if (version<= "26.0.50" emacs-version)
    (add-hook 'prog-mode-hook 'display-line-numbers-mode)
  (add-hook 'prog-mode-hook 'linum-mode))

;; Highlight parenteses in prog-mode.
(add-hook 'prog-mode-hook 'show-paren-mode)

;; Use Allmann style indentation for C code. Use spaces instead of
;; tabs, and set tab width to 8 spaces.
(setq-default c-default-style "bsd"
              c-basic-offset 8
	      indent-tabs-mode nil)

;; `eshell' related functions.
(defun rha-open-eshell ()
  "Open `eshell' in a new window below the selected window."
  (interactive)
  (split-window-below)
  (windmove-down)
  (set-window-text-height (selected-window) 20)
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

(delete-selection-mode 1)           ; Overwrite region
(set-fringe-mode 0)                 ; Disable fringes
(fset 'yes-or-no-p 'y-or-n-p)       ; Enable shorter answers
(setq confirm-kill-emacs 'y-or-n-p  ; Enable confirm on exit
      ring-bell-function 'ignore)   ; Disable the alarm bell
