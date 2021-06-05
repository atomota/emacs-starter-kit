(require 'color-theme)
(if (or (equal window-system 'x)
        (equal window-system 'mac))
    (progn
      (if (or (equal system-type 'windows-nt)
              (equal system-type 'cygwin)
              (equal system-type 'gnu/linux))
          (color-theme-zenburn) (color-theme-blackboard))))

