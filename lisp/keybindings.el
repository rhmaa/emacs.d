;;; keybindings.el --- Custom keybindings -*- lexical-binding:t -*-

;; Command as meta and option as alt on OS X.
(setq mac-option-key-is-meta 'nil
      mac-command-key-is-meta 't
      mac-command-modifier 'meta
      mac-option-modifier 'nil)

;; Make angle brackets easier to use with the Swedish Pok3r layout. By
;; default these are bound to Fn-ESC and Shift-ESC.
(global-set-key (kbd "C-§")
                '(lambda ()
                   (interactive)
                   (insert "<")))
(global-set-key (kbd "C-°")
                '(lambda ()
                   (interactive)
                   (insert ">")))

;; C-x C-b calls `buffer-menu' instead of `buffer-list'.
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; C-c C-f finds the file at point.
(global-set-key (kbd "C-c C-f") 'find-file-at-point)

;; C-x t opens eshell in a new window below the selected window.
(global-set-key (kbd "C-x t") 'rha-open-eshell)
