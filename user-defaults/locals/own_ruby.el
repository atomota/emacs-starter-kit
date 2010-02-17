;;  (setq ri-ruby-script "/home/kristof/.xemacs/ri-emacs.rb")
;;  (autoload 'ri "/home/kristof/.xemacs/ri-ruby.el" nil t)
;
(setq ri-ruby-script (concat emacs-root "user-defaults/add-ons/ri-emacs/current/ri-emacs.rb"))
(autoload 'ri (concat emacs-root "user-defaults/add-ons/ri-emacs/current/ri-ruby.el"))

;; bind help to f1,...
(add-hook 'ruby-mode-hook (lambda ()
     (local-set-key "\C-c\C-c" (quote ri-ruby-complete-symbol))
     (local-set-key "\C-c\C-a" (quote ri-ruby-show-args))
     (local-set-key "\C-c\C-i" (quote ri))
;;     (local-set-key  "f3" 'ri-ruby-show-args)
;;     (local-set-key  "f2" 'ri-ruby-complete-symbol)
;;     (local-set-key  "f1" 'ri)
))


(add-to-list 'auto-mode-alist '("\\Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.*rake$" . ruby-mode))

(provide 'own_ruby)
