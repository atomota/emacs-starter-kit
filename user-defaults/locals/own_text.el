(add-hook 'text-mode-hook (lambda ()
    (local-set-key '[C-return] 'ispell-complete-word)
    (force-flyspell-mode)
))

(provide 'own_text)