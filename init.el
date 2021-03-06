;; to myself
;; don't include if you don't know what something do
;; include only absolutely nessesary plugins and features
;; remember to keep dotfiles as clean as possible

(setq dotfiles-dir "~/.emacs.d/")
(setq code-dir "~/Code/")

(add-to-list 'load-path dotfiles-dir)

(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(setq inhibit-splash-screen t)
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
(setq initial-scratch-message nil)
(setq confirm-nonexistent-file-or-buffer nil)
(setq default-directory code-dir )
(setq-default cursor-type '(bar . 1))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 200))
(setq default-directory code-dir)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(global-linum-mode t)

(electric-pair-mode t)
(setq ns-command-modifier 'meta)
(setq x-select-enable-clipboard t)
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default left-fringe-width  10)

(require 'functions)
(require 'init-package)
(require 'init-el-get)
(require 'init-theme)
(require 'init-ruby)
(require 'init-yasnippet)
(require 'init-ido)
(require 'init-yaml)
(require 'init-sml)
(require 'init-projectile)
(require 'init-auto-complete)
(require 'init-multiple-cursors)
(require 'init-treetop)

(exec-path-from-shell-initialize)
