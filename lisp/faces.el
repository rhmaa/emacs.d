;;; faces.el --- Face configurations -*- lexical-binding:t -*-

(when (eq system-type 'darwin)
  (if (member "SF Mono" (font-family-list))
      (set-face-attribute 'default nil :font "SF Mono-15")
    (set-face-attribute 'default nil :height 150)))

(when (display-graphic-p)
  ;; Defaults.
  (set-face-attribute 'default nil
                      :foreground "grey"
                      :background "black")
  (set-face-attribute 'cursor nil
                      :foreground nil
                      :background "white")
  (set-face-attribute 'region nil
                      :foreground nil
                      :background "blue")
  (set-face-attribute 'highlight nil
                      :foreground nil
                      :background "blue")
  (set-face-attribute 'error nil
                      :foreground "red"
                      :bold t)

  ;; Line numbers.
  (set-face-attribute 'line-number nil
                      :foreground "grey40"
                      :background "black")
  (set-face-attribute 'line-number-current-line nil
                      :foreground "white"
                      :background "black")

  ;; Syntax highlighting.
  (set-face-attribute  'font-lock-keyword-face nil
                       :foreground "white"
                       :bold t)
  (set-face-foreground 'font-lock-builtin-face           "white")
  (set-face-foreground 'font-lock-comment-delimiter-face "#67CD5D")
  (set-face-foreground 'font-lock-comment-face           "#67CD5D")
  (set-face-foreground 'font-lock-constant-face          "#8FE1C8")
  (set-face-foreground 'font-lock-doc-face               "#2EC09C")
  (set-face-foreground 'font-lock-function-name-face     "#D4D4D4")
  (set-face-foreground 'font-lock-preprocessor-face      "#86E08F")
  (set-face-foreground 'font-lock-string-face            "#2EC09C")
  (set-face-foreground 'font-lock-type-face              "#86E08F")
  (set-face-foreground 'font-lock-variable-name-face     "#D4D4D4")

  ;; Mode line.
  (set-face-attribute 'mode-line nil
                      :foreground "black"
                      :background "grey"
                      :box nil)
  (set-face-attribute 'mode-line-inactive nil
                      :foreground "grey"
                      :background "grey20"
                      :box nil)
  (set-face-attribute 'mode-line-buffer-id nil
                      :foreground "black"
                      :distant-foreground "gray"
                      :bold t))
