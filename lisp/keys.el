;;; keys.el --- Custom keybindings -*- lexical-binding:t -*-

;; Use command as meta and option as alt on OS X.
(setq mac-option-key-is-meta 'nil
      mac-command-key-is-meta 't
      mac-command-modifier 'meta
      mac-option-modifier 'nil)

;; C-x C-b calls `buffer-menu' instead of `buffer-list'.
;; By default, C-x C-b calls `buffer-list', splits the active window
;; horizontally, and places the buffer list in the newly created
;; window. `buffer-menu' opens the buffer list in the active window.
;; I find this behaviour much easier to work with.
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; C-c C-f finds the file at point.
(global-set-key (kbd "C-c C-f") 'find-file-at-point)

;; M-s swaps the placement of the current window, see
;; `window-swap-states' for more information.
(global-set-key (kbd "M-s") 'window-swap-states)

;; C-c C-l clears the buffer in eshell.
(add-hook 'eshell-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-l") 'eshell/clear)))

;; C-c i finds the Emacs initalisation file.
(global-set-key (kbd "C-c i") (lambda () (interactive)
   (find-file (concat user-emacs-directory "init.el"))))

;;; keys.el ends here
