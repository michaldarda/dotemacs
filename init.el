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
(show-paren-mode 1)

;; stay the rubbish files away from my projects
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-linum-mode t)
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
