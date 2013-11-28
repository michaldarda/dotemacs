;; packages management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
		      twilight-theme
		      ido
		      idomenu
		      smex
		      yasnippet
		      ace-jump-mode
		      magit
		      helm
          helm-projectile
          inf-ruby
          ruby-compilation
		      flymake-ruby
		      yaml-mode
          rhtml-mode
		      coffee-mode
          projectile
		      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-package)
