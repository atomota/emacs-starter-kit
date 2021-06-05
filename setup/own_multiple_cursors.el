; https://github.com/magnars/multiple-cursors.el
; via https://stackoverflow.com/questions/761706/in-emacs-edit-multiple-lines-at-once
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

