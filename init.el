;; don't include if you don't know what something do
;; include only absolutely nessesary plugins and features

(setq dotfiles-dir "~/.emacs.d/")
;; maybe should I changed it to ~/Code???
(setq code-dir "~/Dropbox/")

(add-to-list 'load-path dotfiles-dir)

;; pure editor options

;; disable menu bar, tool bar, scroll bar
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; disable splash screen
(setq inhibit-splash-screen t)

;; highlight matching parens
(show-paren-mode t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

;; Bigger Initial frame
(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 200))

;; stay the rubbish files away from my projects
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-linum-mode t)
(setq linum-format " %d  ")
(electric-pair-mode t)

;; command should be meta
(setq ns-command-modifier 'meta)

(require 'macros)
(require 'init-package)
(require 'init-theme)
(require 'init-ruby)
(require 'init-ido)
(require 'init-idomenu)
(require 'init-yasnippet)
(require 'init-ace-jump-mode)
(require 'init-helm)
(require 'init-yaml)
(require 'init-sml)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
