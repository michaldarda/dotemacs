(require 'projectile)

(projectile-global-mode 1)

(setq projectile-enable-caching t)

(global-set-key (kbd "M-t") 'projectile-find-file)

;(setq projectile-completion-system 'grizzl)

(provide 'init-projectile)
