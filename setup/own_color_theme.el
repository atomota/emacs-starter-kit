(progn

  (require 'color-theme)
  (if (or (equal window-system 'x)
          (equal window-system 'mac))
      (progn
        (if (eq system-type 'windows-nt)
            (color-theme-zenburn)
          (color-theme-blackboard)))))

(provide 'own_color_theme)
