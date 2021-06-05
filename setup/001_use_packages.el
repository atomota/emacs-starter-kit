(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)
         ("C--" . er/contract-region)))

(use-package json-mode
  :ensure t)

(use-package magit
  :ensure t
  :bind (
	 ("C-x g" . magit-status)))

(use-package dockerfile-mode
  :ensure t)


(use-package dockerfile-mode
  :ensure t)


(use-package groovy-mode
  :ensure t)
