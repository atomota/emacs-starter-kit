;; setup local/mobile environment by client-specific config

;(setq org-directory "~/org")
;(setq org-agenda-files (quote ("~/org/")))


(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "SOMEDAY(y)" "STARTED(s)" "WAITING(w)" "DELEGATED(l)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-tag-alist '(("PHONE" . ?p) ("STUDY" . ?y) ("READ" . ?r) ("SHOP" . ?s) ("WORK" . ?w)))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(add-hook 'org-mode-hook (lambda ()
    ;(ispell-change-dictionary own_german_dict nil)
    ;(local-set-key '[C-return] 'ispell-complete-word)
    ;(force-flyspell-mode)
    (flyspell-mode 0) 
))

(provide 'own_org)
