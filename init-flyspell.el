(require 'flyspell)
(setq flyspell-issue-message-flg nil)

;; flyspell mode breaks auto-complete mode without this.
(ac-flyspell-workaround)

(provide 'init-flyspell)
