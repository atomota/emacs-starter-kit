;; SVN
(require 'vc-svn)

;; active modes 
(add-hook 'svn-log-edit-mode-hook (lambda ()
    (force-flyspell-mode)
))

;; show only changed files
(setq svn-status-hide-unmodified t)
(provide 'own_vc)
