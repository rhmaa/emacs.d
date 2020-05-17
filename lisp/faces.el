;;; faces.el --- Face configurations -*- lexical-binding:t -*-

;; Disable font lock in text consoles.
(unless (display-graphic-p)
  (global-font-lock-mode 0))

(when (display-graphic-p)
  ;; Use SF Mono on Mac.
  (when (eq system-type 'darwin)
    (if (member "SF Mono" (font-family-list))
	(set-face-attribute 'default nil :font "SF Mono-15")
      (set-face-attribute 'default nil :height 150)))

  ;; Use Fira Mono elsewhere.
  (when (not (eq system-type 'darwin))
    (if (member "Fira Mono" (font-family-list))
	(set-face-attribute 'default nil :font "Fira Mono-11")
      (set-face-atribute 'default nil :height 110)))

  ;; Defaults.
  (set-face-attribute 'default nil
		      :foreground "#bebebe"
		      :background "#000000")
  (set-face-attribute 'region nil
		      :foreground nil
		      :background "#0000ff")
  (set-face-attribute 'highlight nil
		      :foreground nil
		      :background "#0000ff")
  (set-face-attribute 'error nil
		      :foreground "#ff0000"
		      :bold t)
  (set-face-attribute 'vertical-border nil
		      :foreground "#303030"
		      :background nil)

  ;; Cursor.
  (setq-default cursor-type 'bar)
  (set-face-attribute 'cursor nil
		      :foreground nil
		      :background "lightgreen")

  ;; Mode line.
  (set-face-attribute 'mode-line nil
		      :foreground "#000000"
		      :background "#bebebe"
		      :family "Lucida Grande"
		      :height 0.90
		      :box nil)
  (set-face-attribute 'mode-line-inactive nil
		      :foreground "#bebebe"
		      :background "#303030"
		      :box nil)
  (set-face-attribute 'mode-line-buffer-id nil
		      :foreground "#000000"
		      :distant-foreground "#bebebe"
		      :bold t)

  ;; Line numbers.
  (when (version<= "26.0.50" emacs-version)
    (set-face-attribute 'line-number nil
			:foreground "#606060"
			:background "#000000")
    (set-face-attribute 'line-number-current-line nil
			:foreground "#ffffff"
			:background "#000000"))

  ;; ;; Syntax highlighting, grey on black, purple accents.
  ;; (set-face-foreground 'font-lock-builtin-face "#ffffff")
  ;; (set-face-foreground 'font-lock-comment-delimiter-face "#473c8b")
  ;; (set-face-foreground 'font-lock-comment-face "#473c8b")
  ;; (set-face-foreground 'font-lock-constant-face "#ff00ff")
  ;; (set-face-foreground 'font-lock-doc-face "#808080")
  ;; (set-face-foreground 'font-lock-function-name-face "#d4d4d4")
  ;; (set-face-foreground 'font-lock-keyword-face "#ffffff")
  ;; (set-face-foreground 'font-lock-preprocessor-face "#9f79ee")
  ;; (set-face-foreground 'font-lock-string-face "#808080")
  ;; (set-face-foreground 'font-lock-type-face "#9f79ee")
  ;; (set-face-foreground 'font-lock-variable-name-face "#d4d4d4")

  ;; Syntax highlighting, grey on black, green accents.
  (set-face-foreground 'font-lock-builtin-face "#ffffff")
  (set-face-foreground 'font-lock-comment-delimiter-face "#67cd5d")
  (set-face-foreground 'font-lock-comment-face "#67cd5d")
  (set-face-foreground 'font-lock-constant-face "#8fe1c8")
  (set-face-foreground 'font-lock-doc-face "#2ec09c")
  (set-face-foreground 'font-lock-function-name-face "#d4d4d4")
  (set-face-foreground 'font-lock-keyword-face "#ffffff")
  (set-face-foreground 'font-lock-preprocessor-face "#86e08f")
  (set-face-foreground 'font-lock-string-face "#2ec09c")
  (set-face-foreground 'font-lock-type-face "#86e08f")
  (set-face-foreground 'font-lock-variable-name-face "#d4d4d4")

  ;; Eshell prompt.
  (setq eshell-prompt-function
	(lambda nil
	  (concat
	   (propertize (eshell/pwd) 'face `(:foreground "#ff00ff"))
	   (propertize " $ " 'face `(:foreground "#bebebe")))))
  (setq eshell-highlight-prompt nil)

  ;; Following is an attempt to make the default Emacs minibuffer /
  ;; echo area more similar to the Aquamacs appearance. This is an
  ;; awful hack, and I don't think I will use it...

  ;; ;; Minibuffer.
  ;; (defun rha/minibuffer-setup()
  ;;   (set (make-local-variable 'face-remapping-alist)
  ;; 	 '((default :family "Lucida Grande"))))
  ;; (add-hook 'minibuffer-setup-hook 'rha/minibuffer-setup)

  ;; ;; Echo area.
  ;; (with-current-buffer (get-buffer " *Echo Area 0*")
  ;;   (setq-local face-remapping-alist
  ;; 		'((default (:family "Lucida Grande") variable-pitch))))
)
