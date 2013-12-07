(defun init () 
  "Open my init el file"
  (interactive)
  (find-file (concat dotfiles-dir "init.el")))

(defun reinit ()
  "Reloads settings without restarting Emacs"
  (interactive)
  (load-file (concat dotfiles-dir "init.el")))

(defun scratchpad () 
  "Opening a file with quick notes"
  (interactive)
  (find-file "~/Dropbox/scratchpad"))

(defun code ()
  "Opening a folder with all my code"
  (interactive)
  (dired code-dir))

(provide 'functions)
