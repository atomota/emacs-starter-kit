(add-hook 'jde-mode-hook (lambda ()
    (local-set-key '[C-return] 'jde-complete)
    (local-set-key "\C-c\C-j" 'jde-compile)))

;set tweaky pendant of "JAVA_HOME" for OSX 
(if  (eq system-type 'darwin) 
	(custom-set-variables 
	 '(jde-jdk-registry (quote (("1.5.0" . "/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0")))))
  nil)

(provide 'own_java)