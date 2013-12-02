;; to myself
;; don't include if you don't know what something do
;; include only absolutely nessesary plugins and features
;; remember to keep dotfiles as clean as possible

(setq dotfiles-dir "~/.emacs.d/")
(setq code-dir "~/Code/")

(add-to-list 'load-path dotfiles-dir)

;; pure editor options

;; disable menu bar, tool bar, scroll bar
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; disable splash screen
(setq inhibit-splash-screen t)

;; highlight matching parens
(show-paren-mode t)

(set-default-font "Inconsolata-14")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

;(setq-default cursor-type '(bar . 1))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Bigger Initial frame
(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 200))

(setq default-directory "~/")

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

(setq x-select-enable-clipboard t)

(require 'functions)
(require 'init-package)
(require 'init-el-get)
(require 'init-theme)
(require 'init-ruby)
(require 'init-yasnippet)
(require 'init-helm)
(require 'init-yaml)
(require 'init-sml)
(require 'init-projectile)
(require 'init-auto-complete)
(require 'multiple-cursors)
