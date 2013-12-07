;; enables that funny flex matching in find files
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; same as ido but for command mode
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

(provide 'init-ido)
