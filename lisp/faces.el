;;; faces.el --- Face configurations -*- lexical-binding:t -*-

(when (eq system-type 'darwin)
  (if (member "SF Mono" (font-family-list))
      (set-face-attribute 'default nil :font "SF Mono-15")
    (set-face-attribute 'default nil :height 150)))

(when (display-graphic-p)
  ;; Defaults.
  (set-face-attribute 'default nil
                      :foreground "#bebebe"
                      :background "#000000")
  (set-face-attribute 'cursor nil
                      :foreground nil
                      :background "#90ee90")
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

  ;; Mode line.
  (set-face-attribute 'mode-line nil
                      :foreground "#000000"
                      :background "#bebebe"
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
  (set-face-attribute 'line-number nil
                      :foreground "#606060"
                      :background "#000000")
  (set-face-attribute 'line-number-current-line nil
                      :foreground "#ffffff"
                      :background "#000000")
  
  ;; Syntax highlighting.
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
           (propertize (eshell/pwd) 'face `(:foreground "#00ffff"))
           (propertize " $ " 'face `(:foreground "#bebebe")))))
  (setq eshell-highlight-prompt nil))
