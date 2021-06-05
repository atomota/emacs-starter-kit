(global-set-key (kbd "C-x p f") #'project-find-file)

;; You know, like Readline.
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)
;; binding also completion to "\M-return"
(global-set-key "\215" 'hippie-expand)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; some bookmark binding
(define-key global-map [f5] 'bookmark-set)
(define-key global-map [f6] 'bookmark-jump)

(define-key global-map (kbd "C-c c") 'org-capture)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; push todos
(define-key global-map [f11] 'my-org-mobile-sync-pull-and-push)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; jump windows for and backward with shift + cursor up/down
(defun other-window-backward (n)
  "Select Nth previous window."
  (interactive "p")
  (other-window (- n)))
(global-set-key [(shift down)] 'other-window)
(global-set-key [(shift up)] 'other-window-backward)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; If you want to be able to M-x without meta (phones, etc)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; binding tags-completion to Shift-Return
(global-set-key (quote [S-return]) (quote complete-symbol))
;; tags searching
(global-set-key "\M-s" 'tags-search)

(global-set-key "\C-x\C-y" 'anything)

(global-set-key "\M-g" 'goto-line)

;; open URLS by clicking with mouse + shift
(global-set-key [S-mouse-3] 'browse-url-at-mouse)

;add imenu to mouse 3
(global-set-key [M-S-mouse-3] 'imenu)

;(provide 'global-key-bindings)
