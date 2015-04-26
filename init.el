(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq custom-file (concat dotfiles-dir "custom.el"))

(package-initialize)

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name)
      setup-dir (concat dotfiles-dir "setup")
      import-dir (concat dotfiles-dir "import"))
(add-to-list 'load-path import-dir)
(add-to-list 'load-path setup-dir)
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p import-dir)
  (mapc #'load (directory-files import-dir nil ".*el$")))

(if (file-exists-p setup-dir)
  (mapc #'load (directory-files setup-dir nil ".*el$")))

(if (file-exists-p system-specific-config) (load system-specific-config))

(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))

(if (file-exists-p user-specific-config) (load user-specific-config))
