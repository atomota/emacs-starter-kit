;; COMMENTED 05.06.2021 - remove commented following in future when operation is proper
;; should be fixed with emacs 24.4.x as described in https://bugs.launchpad.net/emacs-snapshot/+bug/1251176
;;(require 'iso-transl)

;; Built-in project package
(require 'project)

;; Prevent garbage collections by high threshold
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; character encoding
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

;; tabs
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat user-emacs-directory "places")
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      truncate-partial-width-windows nil
      xterm-mouse-mode t)

;; save bookmarks automatically
(setq bookmark-save-flag 1)

;; default major mode
(setq default-major-mode 'text-mode)

;; use this for tramp to cache passwords e.g. for ssh sessions
(setq password-cache-expiry 3600)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

(ansi-color-for-comint-mode-on)

;; Transparently open compressed files
(auto-compression-mode t)

;; use ido
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-filename-at-point 'guess)

;; no menu bar, no tool bar and no scroll bars
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; show file size, cursor's line and column position at the bottom
(line-number-mode)
(column-number-mode)
(size-indication-mode)
                                        ;(global-display-line-numbers-mode)


;; highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; enable mouse wheel support
(mouse-wheel-mode t)

(auto-save-mode nil) 
                                        ;(setq auto-save-default nil)
                                        ;(setq make-backup-files nil)

; https://stackoverflow.com/questions/23317002/how-to-create-temporary-files-filename-in-tmp-not-working-directory
(setq create-lockfiles nil)

;; marked section is removed when pressing key 
(delete-selection-mode t)

;; update buffers when files where changed from outside : https://stackoverflow.com/questions/1480572/how-to-have-emacs-auto-refresh-all-buffers-when-files-have-changed-on-disk
(global-auto-revert-mode t)

;; files are unique in buffers by putting part of it's directory name before
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; returns to the same point of file when visiting again
(require 'saveplace)
(setq-default save-place t)

;; setup to get sane flyspell everywhere
(require 'flyspell)
;; force flyspell mode to be active
(defun force-flyspell-mode ()
  "Activates flyspell-mode, whether already active or not."
  (flyspell-mode 1))

;; always print "emacs" and current file name in window title
(when window-system
  (setq frame-title-format '("emacs - " (buffer-file-name "%f" ("%b")))))

;; TODO remove this when using emacs 25+
;;
;; bug of pasting in emacs.
;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16737#17
;; http://ergoemacs.org/misc/emacs_bug_cant_paste_2015.html
                                        ;(setq x-selection-timeout 300)

(setq calendar-week-start-day 1
      calendar-day-name-array ["Sonntag" "Montag" "Dienstag" "Mittwoch"
                               "Donnerstag" "Freitag" "Samstag"]
      calendar-month-name-array ["Januar" "Februar" "März" "April" "Mai"
                                 "Juni" "Juli" "August" "September"
                                 "Oktober" "November" "Dezember"])


;;get rid of alarming
(setq ring-bell-function 'ignore)
(setq visible-bell nil)

(server-start)
