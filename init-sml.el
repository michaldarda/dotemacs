(setenv "PATH" (concat "/usr/local/opt/smlnj/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/opt/smlnj/bin"  exec-path))

(provide 'init-sml)
