(require 'projectile)

(projectile-global-mode 1)

;(setq projectile-enable-caching t)

(setq projectile-globally-ignored-directories 
      (append '(".git") projectile-globally-ignored-directories))
(setq projectile-globally-ignored-files 
      (append '("*.png" 
                "*.jpeg" 
                "*.jpg"
                "*.tiff") projectile-globally-ignored-files))

(global-set-key (kbd "M-t") 'helm-projectile)

(provide 'init-projectile)
