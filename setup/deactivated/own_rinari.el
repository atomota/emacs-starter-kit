;(require 'rinari)

;; RINARI Is Not A Rails IDE
;; run following shell command to support keyword completion:
;;  ctags-exuberant -a -e -f TAGS --tag-relative -R app liB vendor
(setq rinari-tags-file-name "TAGS")

(provide 'own_rinari)