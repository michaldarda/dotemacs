(require 'projectile)

(projectile-global-mode 1)

(setq projectile-enable-caching t)

(global-set-key (kbd "M-t") 'projectile-find-file)

;(setq projectile-completion-system 'grizzl)

(require 'fiplr)
(setq fiplr-ignored-globs '((directories (".git" ".svn" "log" "tmp"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-directories ".bundle")
     (add-to-list 'grep-find-ignored-directories "tmp")
     (add-to-list 'grep-find-ignored-directories "coverage")
     (add-to-list 'grep-find-ignored-directories "log")))

(provide 'init-projectile)
