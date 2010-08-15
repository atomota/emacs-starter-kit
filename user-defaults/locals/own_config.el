;; Setup to get sane flyspell everywhere
(require 'flyspell)

;; SVN
(require 'vc-svn)

;;InteractivelyDoThings
;;(require 'ido)
;;(ido-mode t)

(require 'color-theme)
(if (or (equal window-system 'x)
        (equal window-system 'mac))
    (progn
      (color-theme-blackboard)
      (menu-bar-mode)))

;;(speedbar-toggle-show-all-files)
;;(setq speedbar-show-unknown-files t)

;; Ignores starting screen of emacs
(setq inhibit-splash-screen t)

;; save bookmarks automatically
(setq bookmark-save-flag 1)

;; formating blocks of code (should be done with tab)
;(global-set-key "\C-xi" 'indent-region)

;; CRTL+SHIFT+? uses dictionary
(global-set-key (quote [67108927]) (quote dictionary-lookup-definition))

(global-set-key (quote [C-f1]) (quote twitter-get-friends-timeline))

;; binding buffer-completion to "\M-return"
(global-set-key "\215" 'dabbrev-expand)

;; binding tags-completion to Shift-Return
(global-set-key (quote [S-return]) (quote complete-symbol))

(global-set-key "\M-s" 'tags-search)

;;use ibuffer instead vanilla ones
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key "\C-x\C-y" 'anything)

;; some bookmark binding
(define-key global-map [f5] 'bookmark-set)
(define-key global-map [f6] 'bookmark-jump)

(global-set-key "\M-g" 'goto-line)

;; use control keys instead of ALT-x for meta commands
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; open URLS by clicking with mouse + shift
(global-set-key [S-mouse-3] 'browse-url-at-mouse)


;try to add iMenu to every major mode
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-menubar-index) (error nil)))

;add imenu to mouse 3
(global-set-key [M-S-mouse-3] 'imenu)

(add-hook 'font-lock-mode-hook 'try-to-add-imenu)

(setq default-major-mode 'text-mode)

(auto-save-mode nil) ; get rid of those annoying ## files

;; bind browse-kill-ring to M-y if last command was not a yank
(defadvice yank-pop (around kill-ring-browse-maybe (arg))
  "If last action was not a yank, run `browse-kill-ring' instead."
  (if (not (eq last-command 'yank))
      (browse-kill-ring)
    ad-do-it))
(ad-activate 'yank-pop)

;; Function of fun
(defun force-flyspell-mode ()
  "Activates flyspell-mode, whether already active or not."
  (flyspell-mode 1))

;; auto load emacs server to enable plugins for ff like "it's all text"
(server-start)

; set default tab size to 4 chars
(setq default-tab-width 4)


;; ; enhance splitting of window functions
;; (defadvice split-window-vertically
;;     (after my-window-vert-splitting-advice first () activate)
;;     (set-window-buffer (next-window) (other-buffer)))
;; (defadvice split-window-horizontally
;;     (after my-window-horiz-splitting-advice first () activate)
;;     (set-window-buffer (next-window) (other-buffer)))

;use this for tramp to cache passwords e.g. for ssh sessions
(setq password-cache-expiry 3600)



(provide 'own_config)
