;; packages management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      yasnippet
                      magit
                      ido
                      idomenu
                      ido-vertical-mode
                      flx-ido
                      smex
                      inf-ruby
                      ruby-compilation
                      enh-ruby-mode
                      flymake-ruby
                      yaml-mode
                      rhtml-mode
                      rspec-mode
                      coffee-mode
                      projectile
                      auto-complete              
                      multiple-cursors)
  " A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-package)
