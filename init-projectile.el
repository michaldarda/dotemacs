(require 'projectile)

(projectile-global-mode 1)

;(setq projectile-enable-caching t)

(global-set-key (kbd "M-t") 'projectile-find-file)
(global-set-key (kbd "M-p") 'projectile-switch-project)

(setq projectile-globally-ignored-files (append '("*.png" "*.jpg" ".*jpeg" "*.eot" "*.otf" "*.svg") projectile-globally-ignored-files))

(provide 'init-projectile)
