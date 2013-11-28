;; useful macros
(defun open-settings () 
  "Open my init el file"
  (interactive)
  (find-file (concat dotfiles-dir "init.el")))

(defun reload-settings ()
  "Reloads settings without restarting Emacs"
  (interactive)
  (load-file (concat dotfiles-dir "init.el")))

(defun scratchpad () 
  "Opening a file with quick notes"
  (interactive)
  (find-file (concat code-dir "scratchpad")))

(defun code ()
  "Opening a folder with all my code"
  (interactive)
  (dired code-dir))

(provide 'functions)
