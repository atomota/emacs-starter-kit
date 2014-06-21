(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Load up ELPA, the package manager
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)
;(require 'starter-kit-elpa)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; backport some functionality to Emacs 22 if needed
;(require 'dominating-file)

;; Load up starter kit customizations

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
;(require 'starter-kit-registers)
;(require 'starter-kit-eshell)
;(require 'starter-kit-lisp)
;(require 'starter-kit-perl)
;(require 'starter-kit-ruby)
;(require 'starter-kit-js)

(require 'better-defaults)

(regen-autoloads)
(load custom-file 'noerror)

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name)
      user-defaults-dir (concat dotfiles-dir "user-defaults"))
(add-to-list 'load-path user-specific-dir)
(add-to-list 'load-path user-defaults-dir)

;; add here my changes to keep it from the starter kit separately
(if (file-exists-p user-defaults-dir)
  (mapc #'load (directory-files user-defaults-dir nil ".*el$")))

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))
(if (file-exists-p user-specific-config) (load user-specific-config))

;;; init.el ends here
