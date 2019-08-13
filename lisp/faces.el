;;; faces.el --- Face configurations -*- lexical-binding:t -*-

(when (eq system-type 'darwin)
  (if (member "SF Mono" (font-family-list))
      (set-face-attribute 'default nil :font "SF Mono-15")
    (set-face-attribute 'default nil :height 150)))

(when (display-graphic-p)
  (require 'naysayer-theme)
  (load-theme 'naysayer t)
  (set-face-attribute 'mode-line-inactive nil
		      :background "#C9C8CA"
		      :foreground "#0A1C1E"))
