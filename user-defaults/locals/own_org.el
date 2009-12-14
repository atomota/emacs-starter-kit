;(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


(add-hook 'org-mode-hook (lambda ()
    (ispell-change-dictionary own_german_dict nil)
    (local-set-key '[C-return] 'ispell-complete-word)
    (force-flyspell-mode)
))


(provide 'own_org)