(require 'package)

;; FOLLOWING WAS uncommented 03.06.2021 - remove section in future in case of proper operations
;;
;; Workaround to get rid of (false positives) warnings, see:
;;
;; https://github.com/flyingmachine/emacs-for-clojure/issues/26
;; https://github.com/DarwinAwardWinner/ido-completing-read-plus/issues/35
;; (defvar ido-cur-list nil)
;; (defvar ido-cur-item nil)
;; (defvar ido-default-item nil)
;; (defvar inherit-input-method nil)
;; (defvar mc--read-char nil)
;; (defvar mc--read-quoted-char nil)
;; (defvar multiple-cursors-mode nil)
;; (defvar predicate nil)
;; (defvar rectangular-region-mode nil)

;; MELPA packages
(setq my-packages '(markdown-mode multiple-cursors find-file-in-project idle-highlight-mode es-mode yasnippet smex))

(customize-set-variable
 'package-archives '(("org" . "https://orgmode.org/elpa/")
                     ("melpa" . "https://melpa.org/packages/")
                     ("gnu" . "https://elpa.gnu.org/packages/")))

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
      (package-install p))))



