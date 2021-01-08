;(require 'org-babel)
;(require 'org-babel-init)
;(require 'org-babel-gnuplot)


(org-babel-do-load-languages
 'org-babel-load-languages '((shell . t)
                             (python . t)
                             (plantuml . t)
                             (gnuplot . t)
                             (elasticsearch . t)
                             ))

(setq org-plantuml-jar-path
      (expand-file-name "~/Downloads/plantuml.jar"))


(print org-plantuml-jar-path)

;;https://emacs.stackexchange.com/a/15048
(add-hook 'org-babel-after-execute-hook
          (lambda ()
            (when org-inline-image-overlays
              (org-redisplay-inline-images))))

(setq org-src-fontify-natively t)

;; no plant uml
(defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("plantuml" "elisp" "gnuplot" "es" ))))

(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(provide 'own_babel)
