;; Setup local environment by client-specific config
;;
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


(setq org-capture-templates
 '(("t" "Todo" entry (file "todo.org")
        "* TODO %?\n %U\n%i\nQ: %a")
   ("j" "Journal" entry (file+datetree "journal.org")
        "* %?\nT: %U\n%i\nQ: %a")))
;
;; https://orgmode.org/manual/TODO-dependencies.html
(setq org-enforce-todo-dependencies t)

;; TODO reset subtask for recurring TODOs, like this: https://superuser.com/questions/694666/org-mode-repeating-tasks-with-subtasks

