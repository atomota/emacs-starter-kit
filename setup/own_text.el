(add-hook 'text-mode-hook (lambda ()
    (flyspell-mode 0) 
    ;(local-set-key '[C-return] 'ispell-complete-word)
    ;(add-hook 'text-mode-hook 'turn-on-auto-fill)
    ;(add-hook 'text-mode-hook 'turn-on-flyspell)
))

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

