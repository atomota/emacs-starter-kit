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

(setq org-directory "~/Documents/org")
(setq org-agenda-files (quote ("~/Documents/org/")))
(setq org-mobile-directory "~/Documents/org/stage")
(setq org-mobile-inbox-for-pull "~/Documents/org/from-mobile.org")

;; add hooks for own webdav/ssh sync
(add-hook 'org-mobile-post-push-hook
  (lambda () (shell-command "my_org_mobile_push")))
(add-hook 'org-mobile-pre-pull-hook
  (lambda () (shell-command "my_org_mobile_pre_pull")))
(add-hook 'org-mobile-post-pull-hook
  (lambda () (shell-command "my_org_mobile_post_pull")))


;; following allows mobile org to sync automatically via cron
(defvar my-org-mobile-sync-timer nil)
(defvar my-org-mobile-sync-secs (* 60 15))

(defun my-org-mobile-sync-pull-and-push ()
  "Start pulling via `org-mobile-pull' and afterwards pushing `org-mobile-push' of org mode data"
  (interactive)
  (org-mobile-pull)
  (org-mobile-push))

(define-key global-map [f10] 'my-org-mobile-sync-pull-and-push)


(defun my-org-mobile-sync-start ()
  "Start automated `org-mobile-push'"
  (interactive)
  (setq my-org-mobile-sync-timer
        (run-with-idle-timer my-org-mobile-sync-secs t
                             'my-org-mobile-sync-pull-and-push)))

(defun my-org-mobile-sync-stop ()
  "Stop automated `org-mobile-push'"
  (interactive)
  (cancel-timer my-org-mobile-sync-timer))

;(my-org-mobile-sync-start)


(provide 'own_org)
