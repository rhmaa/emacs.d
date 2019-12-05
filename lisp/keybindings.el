;;; keybindings.el --- Custom keybindings -*- lexical-binding:t -*-

;; Command as meta and option as alt on OS X.
(setq mac-option-key-is-meta 'nil
      mac-command-key-is-meta 't
      mac-command-modifier 'meta
      mac-option-modifier 'nil)

;; C-x C-b calls `buffer-menu' instead of `buffer-list'.
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; C-c C-f finds the file at point.
(global-set-key (kbd "C-c C-f") 'find-file-at-point)

;; C-x t opens eshell in a new window below the selected window.
(global-set-key (kbd "C-x t") 'rha/open-eshell)

;; C-c C-l clears the buffer in eshell.
(add-hook 'eshell-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-l") 'eshell/clear)))
