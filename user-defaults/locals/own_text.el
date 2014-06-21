(add-hook 'text-mode-hook (lambda ()
    ;(local-set-key '[C-return] 'ispell-complete-word)
    ;(force-flyspell-mode)
    (flyspell-mode 0) 
))

(provide 'own_text)
