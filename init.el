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

(setq initial-scratch-message nil)
(setq confirm-nonexistent-file-or-buffer nil)


(setq-default cursor-type '(bar . 1))

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
(electric-pair-mode t)

;; command should be meta
(setq ns-command-modifier 'meta)

(setq x-select-enable-clipboard t)

(require 'functions)
(require 'init-package)
(require 'init-el-get)
(require 'init-theme)
(require 'init-ruby)
(require 'init-web-mode)
(require 'init-yasnippet)
(require 'init-ido)
(require 'init-idomenu)
(require 'init-yaml)
(require 'init-sml)
(require 'init-projectile)
(require 'init-auto-complete)
(require 'init-multiple-cursors)

(require 'grizzl)

(require 'chruby)
(chruby "ruby-2.0.0-p353")


;; Find root directory by searching for Gemfile
(defun* get-closest-gemfile-root (&optional (file "Gemfile"))
  (let ((root (expand-file-name "/")))
    (loop
     for d = default-directory then (expand-file-name ".." d)
     if (file-exists-p (expand-file-name file d))
     return d
     if (equal d root)
     return nil)))

(defun find-spec-from-file ()
  (interactive)
  (save-excursion
    (find-file
     (replace-regexp-in-string
      "\n$" ""
      (shell-command-to-string
       (concat "find "
               (get-closest-gemfile-root)
               " -type f -name "
               (concat (substring (car (last (split-string (buffer-file-name) "/"))) 0 -3)
                       "_spec.rb")))))))

(defun rspec-format-string (&optional line-p)
  (concat "cd %s && "
          (when (file-directory-p "~/.rvm") "source ~/.rvm/scripts/rvm && rvm use &&")
          "bundle exec rspec --format documentation %s"
          (when line-p " -l %s")))

(defun rspec-compile-file ()
  (interactive)
  (compile (format (rspec-format-string)
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   ) t))

(defun rspec-compile-on-line ()
  (interactive)
  (compile (format (rspec-format-string t)
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   (line-number-at-pos)
                   ) t))

(local-set-key (kbd "C-c l") 'rspec-compile-on-line)
(local-set-key (kbd "C-c t") 'rspec-compile-file)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.
This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'font-lock-comment-annotations)

(setq left-margin-width 10)
