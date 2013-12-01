(require 'helm-config)
(require 'helm-themes)

(helm-mode 1)
(global-set-key (kbd "M-p") 'helm-mini)

(provide 'init-helm)
