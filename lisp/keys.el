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

;; General.
(global-set-key (kbd "C-c C-f") 'find-file-at-point)
(global-set-key (kbd "M-s") 'window-swap-states)
(global-set-key (kbd "C-c i") (lambda () (interactive)
   (find-file (concat user-emacs-directory "init.el"))))

;; Eshell.
(add-hook 'eshell-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c l") 'eshell/clear)))

;; Magit.
(global-set-key (kbd "C-c g") 'magit-file-dispatch)
(global-set-key (kbd "C-c d") 'magit-diff-buffer-file)
(global-set-key (kbd "C-c C-s") 'magit-diff-staged)
(global-set-key (kbd "C-c C-d") 'magit-diff-unstaged)
(global-set-key (kbd "C-c s") 'magit-status)
(global-set-key (kbd "C-c p") 'magit-push)
(global-set-key (kbd "C-c C-p") 'magit-push-current-to-upstream)
(global-set-key (kbd "C-c c") 'magit-clone)

;;; keys.el ends here
