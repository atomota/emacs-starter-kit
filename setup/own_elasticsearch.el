;;(autoload 'es-mode "es-mode.el" "Major mode for editing Elasticsearch queries" t)

;;Avoids dependency error, see https://github.com/dakrone/es-mode/issues/38
(require 's)

(autoload 'es-mode "es-mode.el" "Major mode for editing Elasticsearch queries" t)
(add-to-list 'auto-mode-alist '("\\.es$" . es-mode))

(setq es-always-pretty-print t)


;(setq es-default-url "localhost:9200")
(setq es-default-url "http://localhost:9200/_search?pretty=true")

(add-hook 'es-mode-hook (lambda ()
                          (yas-minor-mode)
                          ))

(add-hook 'es-result-mode-hook 'hs-minor-mode)


