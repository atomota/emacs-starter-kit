;(require 'org-babel)
;(require 'org-babel-init)
;(require 'org-babel-gnuplot)


(org-babel-do-load-languages
 'org-babel-load-languages '((sh . t)
                             (python . t)
                             (plantuml . t)
                             (gnuplot . t)
                             ))

(setq org-plantuml-jar-path
      (expand-file-name "~/Downloads/plantuml.jar"))


(print org-plantuml-jar-path)

(setq org-src-fontify-natively t)
(provide 'own_babel)
