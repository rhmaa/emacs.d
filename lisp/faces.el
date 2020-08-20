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

  ;; Use Consolas on Windows.
  (when (eq system-type 'windows-nt)
    (if (member "Consolas" (font-family-list))
        (set-face-attribute 'default nil :font "Consolas-11")
      (set-face-attribute 'default nil :height 110)))

  ;; Syntax highlighting.
  (set-face-foreground 'font-lock-comment-face "#3f7f5f")
  (set-face-foreground 'font-lock-string-face "#4f004f")
  (set-face-foreground 'font-lock-constant-face "#4f004f")
  (set-face-foreground 'font-lock-keyword-face "#00003f")
  (set-face-foreground 'font-lock-builtin-face "#00003f")
  (set-face-foreground 'font-lock-type-face "#000000")
  (set-face-foreground 'font-lock-function-name-face "#000000")
  (set-face-foreground 'font-lock-variable-name-face "#000000"))
