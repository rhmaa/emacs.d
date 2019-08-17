;;; faces.el --- Face configurations -*- lexical-binding:t -*-

(when (eq system-type 'darwin)
  (if (member "SF Mono" (font-family-list))
      (set-face-attribute 'default nil :font "SF Mono-15")
    (set-face-attribute 'default nil :height 150)))

(when (display-graphic-p)
  ;; Defaults.
  (set-face-attribute 'default nil
                      :foreground "#BEBEBE"
                      :background "#000000")
  (set-face-attribute 'cursor nil
                      :foreground nil
                      :background "#90EE90")
  (set-face-attribute 'region nil
                      :foreground nil
                      :background "#0000FF")
  (set-face-attribute 'highlight nil
                      :foreground nil
                      :background "#0000FF")
  (set-face-attribute 'error nil
                      :foreground "#FF0000"
                      :bold t)
  
  ;; Mode line.
  (set-face-attribute 'mode-line nil
                      :foreground "#000000"
                      :background "#BEBEBE"
                      :box nil)
  (set-face-attribute 'mode-line-inactive nil
                      :foreground "#BEBEBE"
                      :background "#303030"
                      :box nil)
  (set-face-attribute 'mode-line-buffer-id nil
                      :foreground "#000000"
                      :distant-foreground "#BEBEBE"
                      :bold t)
  
  ;; Line numbers.
  (set-face-attribute 'line-number nil
                      :foreground "#606060"
                      :background "#000000")
  (set-face-attribute 'line-number-current-line nil
                      :foreground "#FFFFFF"
                      :background "#000000")
  
  ;; Syntax highlighting.
  (set-face-foreground 'font-lock-builtin-face "#FFFFFF")
  (set-face-foreground 'font-lock-comment-delimiter-face "#67CD5D")
  (set-face-foreground 'font-lock-comment-face "#67CD5D")
  (set-face-foreground 'font-lock-constant-face "#8FE1C8")
  (set-face-foreground 'font-lock-doc-face "#2EC09C")
  (set-face-foreground 'font-lock-function-name-face "#D4D4D4")
  (set-face-foreground 'font-lock-keyword-face "#FFFFFF")
  (set-face-foreground 'font-lock-preprocessor-face "#86E08F")
  (set-face-foreground 'font-lock-string-face "#2EC09C")
  (set-face-foreground 'font-lock-type-face "#86E08F")
  (set-face-foreground 'font-lock-variable-name-face "#D4D4D4"))
