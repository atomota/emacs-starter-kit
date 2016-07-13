(progn

  (require 'color-theme)
  (if (or (equal window-system 'x)
          (equal window-system 'mac))
      (progn
        (if (or (eq system-type 'windows-nt)
                (eq system-type 'cygwin))
            (color-theme-zenburn) (color-theme-blackboard)))))

(provide 'own_color_theme)
