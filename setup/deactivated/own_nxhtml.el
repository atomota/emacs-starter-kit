;(if  (eq  system-type 'darwin) 
;  (load-library "autostart")
;  (load (concat emacs-root (concat nxhtml-root "autostart.el")))
;)

;(require 'mumamo-fun)
;(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . eruby-nxhtml-mumamo-mode))
;(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo-mode))
;(add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mumamo-mode))
;(add-to-list 'auto-mode-alist '("\\.php\\'" . nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . nxhtml-mumamo-mode))


;; artifical HTML header to enable validating of  code fragements
(add-hook 'nxhtml-mode-hook (lambda ()
    (local-set-key '[M-up] 'nxhtml-validation-header-mode)
    (local-set-key '[M-down] 'nxhtml-toggle-visible-warnings)
))



;(setq nxhtml-global-minor-mode t
;      nxhtml-skip-welcome t
;      mumamo-chunk-coloring 'submode-colored)


;;TODO: add following settings in appropriate MUMAMO
;;to avoid popups in html editing?
;;'(popcmp-group-alternatives nil)
;;'(popcmp-popup-completion nil)

;; pressing tab key multiple times uses different completion modes
(tabkey2-mode)


(provide 'own_nxhtml)
