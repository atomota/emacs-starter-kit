(defun my-secret-garden-command-filter (cmd)
  "Filters out all commands which get a password as a parameter to avoid spying by executing command 'command-history'"
  (or (equal (nth 0 cmd ) 'my-secret-garden-edit)
	  (equal (nth 0 cmd ) 'my-secret-garden-show)) )

;; TODO append list element instead of setting it (what about the default list?)
(setq list-command-history-filter 'my-secret-garden-command-filter)

(defun my-secret-garden-edit (password)       
  "Edit secrets"
  (interactive (list (read-passwd "Password: ")))
	(save-excursion
	  (if (bufferp (get-buffer "mysecretgarden")) 
		  (kill-buffer "mysecretgarden") nil)
	  (setenv "MSGPWD" password)
	  ;; TODO if process exits abnormally e.g. return code>1 then print message
	  (start-process "my-secret-garden" "*Messages*" "bash" "--init-file" "~/.emacs.d/msg-edit.sh")
	  (setenv "MSGPWD"))
	(switch-to-buffer "*Messages*"))

(defun my-secret-garden-show (password)       
  "Show secrets"
  (interactive (list (read-passwd "Password: ")))
  (save-excursion
    (if (bufferp (get-buffer "mysecretgarden")) 
        (kill-buffer "mysecretgarden") nil)
	(setenv "MSGPWD" password)    
	(shell-command "openssl enc -a -aes-128-cbc -d -in ~/.mysecretgarden -salt -pass env:MSGPWD" "mysecretgarden")
	(setenv "MSGPWD")
	(set-buffer "mysecretgarden")
    ;(switch-to-buffer "mysecretgarden")
	(toggle-read-only)))

(provide 'mysecretgarden)
