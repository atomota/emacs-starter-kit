(progn
  (mouse-wheel-mode t)
  (ido-mode t)

  ;; make emacs use the clipboard
  (setq x-select-enable-clipboard t)
  
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)

  (ansi-color-for-comint-mode-on)

  ;; Transparently open compressed files
  (auto-compression-mode t)

  (setq ido-enable-flex-matching t
        ido-use-filename-at-point 'guess)

  (menu-bar-mode -1)
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  (require 'saveplace)
  (setq-default save-place t)

  ;; Highlight matching parentheses when the point is on them.
  (show-paren-mode 1)

  (setq-default indent-tabs-mode nil)
  (setq x-select-enable-clipboard t
        x-select-enable-primary t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups"))))

  (set-default 'indent-tabs-mode nil)
  (set-default 'indicate-empty-lines t)
  (set-default 'imenu-auto-rescan t)

  ;; always print "emacs" and current file name in window title
  (when window-system
    (setq frame-title-format '("emacs - " (buffer-file-name "%f" ("%b")))))

  ;; Don't clutter up directories with files~
  (setq backup-directory-alist `(("." . ,(expand-file-name
                                          (concat dotfiles-dir "backups")))))

  ;; ------------------------
  ;; review everything below 

  ;; Setup to get sane flyspell everywhere
  (require 'flyspell)
  
  (require 'color-theme)
  (if (or (equal window-system 'x)
          (equal window-system 'mac))
      (progn
        (if (eq system-type 'windows-nt)
            (color-theme-zenburn)
          (color-theme-blackboard))))

  ;; Ignores starting screen of emacs
  (setq inhibit-splash-screen t)
  
  ;; save bookmarks automatically
  (setq bookmark-save-flag 1)
  
  ;; default major mode
  (setq default-major-mode 'text-mode)
  
  ;; get rid of those annoying ## files
  (auto-save-mode nil) 
  
  ;; set default tab size to 4 chars
  (setq default-tab-width 4)

  ;; use this for tramp to cache passwords e.g. for ssh sessions
  (setq password-cache-expiry 3600)

  ;; try to add iMenu to every major mode
  (defun try-to-add-imenu ()
    (condition-case nil (imenu-add-menubar-index) (error nil)))
  
  (add-hook 'font-lock-mode-hook 'try-to-add-imenu)
  
  ;; Function of fun
  (defun force-flyspell-mode ()
    "Activates flyspell-mode, whether already active or not."
    (flyspell-mode 1))
  
  (server-start)

  (setq visible-bell t
        fringe-mode (cons 4 0)
        echo-keystrokes 0.1
        font-lock-maximum-decoration t
        inhibit-startup-message t
        transient-mark-mode t
        color-theme-is-global t
        shift-select-mode nil
        mouse-yank-at-point t
        require-final-newline t
        truncate-partial-width-windows nil
        uniquify-buffer-name-style 'forward
        ffap-machine-p-known 'reject
        whitespace-style '(trailing lines space-before-tab
                                    face indentation space-after-tab)
        whitespace-line-column 100
        ediff-window-setup-function 'ediff-setup-windows-plain
        oddmuse-directory (concat dotfiles-dir "oddmuse")
        xterm-mouse-mode t
        save-place-file (concat dotfiles-dir "places"))
  

  (add-to-list 'safe-local-variable-values '(lexical-binding . t))
  (add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))
  
  
  (defalias 'yes-or-no-p 'y-or-n-p)
  
  (random t) ;; Seed the random-number generator
  
  (defalias 'auto-revert-tail-mode 'tail-mode)

  
  )
(provide 'global-defaults)
