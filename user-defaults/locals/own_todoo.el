;;TODO new keys for "M-C parts"!
(add-hook 'todoo-mode-hook (lambda ()
    (ispell-change-dictionary "german-new8" nil)
    (local-set-key '[C-return] 'ispell-complete-word)
    (force-flyspell-mode)
    (local-set-key (quote [M-right]) (quote todoo-show-item))
    (local-set-key (quote [M-left]) (quote todoo-hide-item))
    (local-set-key (quote [M-C-right]) (quote show-all))
    (local-set-key (quote [M-C-left]) (quote hide-body))
    (local-set-key '[M-up] 'todoo-raise-item)
    (local-set-key '[M-down] 'todoo-lower-item)

))

;;TODO find another key instead of using windows+return!
(global-set-key (quote [s-return]) (quote todoo))
(add-to-list 'auto-mode-alist '("\\.todo$" . todoo-mode))


(provide 'own_todoo)