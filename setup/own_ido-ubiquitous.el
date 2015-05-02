;; org-mode and magit have their own support for ido
(setq org-completion-use-ido t)
(setq magit-completing-read-function 'magit-ido-completing-read)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(provide 'own_ido-ubiquitious)
