(progn
  (require 'package)

  ;; add gnu packages here , see https://elpa.gnu.org/
  (defvar my-packages '(muse js2-mode))

  ;; further package source marmalade
  (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
  ;; add marmelade packages here
  (setq my-packages (append my-packages '(ido-ubiquitous smex idle-highlight-mode find-file-in-project multiple-cursors markdown-mode web-mode)))

  (package-initialize)
  
  (defvar load-inital-package-list t)

  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (progn
        (if load-inital-package-list
            (progn
              (message "Load package list initally due to missing package(s).")
              (package-list-packages)
              (setq load-inital-package-list nil)))
        (package-install p)))))

(provide '000_own_package)
