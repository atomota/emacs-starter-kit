(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(ecb-layout-name "left-dir-plus-speedbar")
 '(ecb-layout-window-sizes (quote (("left2" (0.19858156028368795 . 0.4807692307692308) (0.19858156028368795 . 0.5)))))
 '(ecb-options-version "2.32")
 '(ecb-show-sources-in-directories-buffer (quote always))
 '(ecb-tip-of-the-day nil)
 '(ecb-windows-height 0.15)
 '(ecb-windows-width 0.2)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(grep-find-command "find . -type f -not -name \"*.svn-base\" -and -not -name \"*~\" -print0 | xargs -0 -e grep -n -s -F ")
 '(javascript-auto-indent-flag nil)
 '(jde-complete-function (quote jde-complete-minibuf))
 '(majmodpri-no-nxml nil)
 '(menu-bar-mode t)
 '(org-agenda-files (quote ("~/Documents/org/todo.org")))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-default-position (quote left))
 '(todoo-collapse-items t)
 '(tool-bar-mode nil)
 '(vc-delete-logbuf-window nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(todoo-item-header-face ((t (:foreground "#FFA" :box nil :weight bold)))))

(provide 'custom-file.el)
