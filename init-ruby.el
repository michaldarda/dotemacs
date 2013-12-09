;; ruby settings

(require 'rspec-mode)
(require 'rhtml-mode)

;; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rubies/ruby-2.0.0-p353/bin:" (getenv "HOME") "/.gem/ruby/2.0.0/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rubies/ruby-2.0.0-p353") (cons (concat (getenv "HOME") "/.gem/ruby/2.0.0/bin") exec-path)))

(setq GEM_HOME "/Users/michal/.gem/ruby/2.0.0")
(setq RUBY_ROOT "/Users/michal/.rubies/ruby-2.0.0-p353")
(setq RUBY_ENGINE "ruby")
(setq RUBY_VERSION "2.0.0")
(setq GEM_ROOT "/Users/michal/.rubies/ruby-2.0.0-p353/lib/ruby/gems/2.0.0")

(setq enh-ruby-program "~/.rubies/ruby-2.0.0-p353/bin/ruby")
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

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

(setq inf-ruby-default-implementation "pry")

(provide 'init-ruby)
