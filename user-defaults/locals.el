(setq  emacs-root (file-truename "~/.emacs.d/"))
(setq load-path (cons emacs-root load-path))

(add-to-list 'load-path (concat emacs-root "user-defaults/locals"))
(add-to-list 'load-path (concat emacs-root "user-defaults/add-ons/"))
(add-to-list 'load-path (concat emacs-root "user-defaults/add-ons/anything-config/"))
(add-to-list 'load-path (concat emacs-root "user-defaults/add-ons/android-mode/"))

;JDE and german dictionary depends to distirbution or platform
(if (eq system-type 'darwin) 
    (progn 
      (setq own_german_dict "german8")
      (load-file (expand-file-name "/Applications/Emacs.app/Contents/Resources/site-lisp/cedet/common/cedet.el"))
      (add-to-list 'load-path (concat emacs-root "user-defaults/add-ons/jde-2.3.5.1/lisp"))
      (require 'jde))        
  (progn
    (setq own_german_dict "german-new8")))

(require 'android-mode)
(require 'own_config)
(require 'own_nxhtml)
(require 'own_ruby)
(require 'own_rinari)
(require 'own_css)
(require 'own_todoo)
(require 'own_vc)
(require 'own_org)
(require 'own_muse)
(require 'anything-config)
(require 'own_text)
(require 'own_java)



;load optional mysecretgarden
(require 'mysecretgarden "~/misc_ws/mysecretgarden/elisp/mysecretgarden.el" t)
