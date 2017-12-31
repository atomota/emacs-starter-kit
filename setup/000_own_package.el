(progn
  (require 'package)

  ;; Workaround to get rid of (false positives) warnings, see:
  ;;
  ;; https://github.com/flyingmachine/emacs-for-clojure/issues/26
  ;; https://github.com/DarwinAwardWinner/ido-completing-read-plus/issues/35

  (defvar ido-cur-item nil)
  (defvar ido-default-item nil)
  (defvar ido-cur-list nil)
  (defvar predicate nil)
  (defvar inherit-input-method nil)
  (defvar multiple-cursors-mode nil)
  (defvar mc--read-char nil)
  (defvar mc--read-char nil)
  (defvar multiple-cursors-mode nil)
  (defvar mc--read-quoted-char nil)
  (defvar mc--read-quoted-char nil)
  (defvar rectangular-region-mode nil)
  
  ;; add gnu packages here , see https://elpa.gnu.org/
  (defvar my-packages '(js2-mode))

  ;; further package source marmalade
  (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
  ;; add marmelade packages here
  (setq my-packages (append my-packages '(ido-ubiquitous smex idle-highlight-mode find-file-in-project multiple-cursors markdown-mode web-mode groovy-mode)))

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
