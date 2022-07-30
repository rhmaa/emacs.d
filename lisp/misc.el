;;; misc.el --- Miscellaneous configurations -*- lexical-binding:t -*-

(setenv "LC_ALL" "en_GB.UTF-8")

(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq-default c-default-style "bsd"
              c-basic-offset 4
	      indent-tabs-mode nil)

(defun rha/open-eshell ()
  "Open `eshell' in a new window below the selected window."
  (interactive)
  (split-window-below)
  (windmove-down)
  (set-window-text-height (selected-window) 24)
  (eshell))
(global-set-key (kbd "C-x C-t") 'rha/open-eshell)

;; Kill the selected window when exiting `eshell'.
(add-hook 'eshell-exit-hook
          (lambda ()
            (when (not (one-window-p))
              (delete-window))))

;; Create temporary files in the system's temporary file directory.
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(column-number-mode)                 ; Display column number in the mode line
(delete-selection-mode)              ; Enable region overwrite
(display-time)                       ; Display the current time in the mode line
(fset 'yes-or-no-p 'y-or-n-p)        ; Enable shorter answers
(setq confirm-kill-emacs 'y-or-n-p)  ; Enable confirm on exit
(setq fill-column 72)                ; Set linewrap at 72 characters
(setq inhibit-startup-screen t)      ; Disable the welcome message
(setq initial-scratch-message nil)   ; Disable the *scratch* message
(setq ring-bell-function 'ignore)    ; Disable the alarm bell

;; Keep `custom-set-variables' out of `init.el'.
(setq custom-file (concat user-emacs-directory "lisp/custom.el"))
(load custom-file)

;;; misc.el ends here
