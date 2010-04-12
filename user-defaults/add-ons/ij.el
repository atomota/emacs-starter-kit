;; (C) Copyright 2009, Bernt Marius Johnsen
;; License: 100% Public Domain
;; Warranty: None, whatsoever

;;taken from http://wiki.apache.org/db-derby/CommandHistoryInIj

(require 'sql)

;; Customization for Derby

(defcustom sql-java-vm "java"
  "Java VM")

(defcustom sql-derby-home (if (getenv "DERBY_HOME") (getenv "DERBY_HOME") "/usr/lib/jvm/java-6-sun/db")
  "Home of derby itself.");

(defcustom sql-ij-classpath 
    (concat (concat sql-derby-home "/lib/derbytools.jar") ":"
            (concat sql-derby-home "/lib/derby.jar") ":"
            (concat sql-derby-home "/lib/derbyclient.jar")) "Ij classpath" )

(defcustom sql-ij-class "org.apache.derby.tools.ij"
  "Ij class")

(defcustom sql-ij-driver "org.apache.derby.jdbc.EmbeddedDriver"
  "JDBC driver");


(defcustom sql-derby-db-home "/var/tmp/ij"
  "Home for Embedded derby databases");

(defvar sql-mode-derby-font-lock-keywords nil
  "Derby SQL keywords used by font-lock.

This variable is used by `sql-mode' and `sql-interactive-mode'.  The
regular expressions are created during compilation by calling the
function `regexp-opt'.  Therefore, take a look at the source before
you define your own sql-mode-derby-font-lock-keywords.  You may want
to add functions and PL/SQL keywords.")
(if sql-mode-derby-font-lock-keywords
    ()
  (let ((derby-keywords (eval-when-compile
                          (concat "\\b"
                                  (regexp-opt '(
                                                ;; Fill in
                                                "index") t) "\\b")))
	(derby-reserved-words (eval-when-compile
                                (concat "\\b"
                                        (regexp-opt '(
                                                      ;; Fill in
                                                      "show") t) "\\b")))
	(derby-types (eval-when-compile
                       (concat "\\b"
                               (regexp-opt '(
                                             ;; Derby Keywords that look like types
                                             ;; Derby Reserved Words that look like types
                                             "binary" "timestamp") t) "\\b")))
	(derby-builtin-functions (eval-when-compile
                                   (concat "\\b"
                                           (regexp-opt '(
                                                         ;; Misc Derby builtin functions
                                                         "unuseddummystring4") t) "\\b"))))
    (setq sql-mode-derby-font-lock-keywords
	  (append sql-mode-ansi-font-lock-keywords
		  (list (cons derby-keywords 'font-lock-function-name-face)
			(cons derby-reserved-words 'font-lock-keyword-face)
			;; XEmacs doesn't have font-lock-builtin-face
			(if (string-match "XEmacs\\|Lucid" emacs-version)
			    (cons derby-builtin-functions 'font-lock-preprocessor-face)
			  ;; GNU Emacs 19 doesn't have it either
			  (if (string-match "GNU Emacs 19" emacs-version)
			      (cons derby-builtin-functions 'font-lock-function-name-face)
			    ;; Emacs
			    (cons derby-builtin-functions 'font-lock-builtin-face)))
			(cons derby-types 'font-lock-type-face))))))

(defun ij ()
  "Run Derby ij as an inferior process in buffer *Derby Ij*

Interpreter used comes from variable `sql-ij-class'.
Java VM comes from variable `sql-java-vm'.
Default JDBC driver comes from `sql-ij-driver'.
Interpreter used comes from variable `sql-ij-class'.
Classpath used comes from variale `sql-ij-classpath'. 
(The default value supports both derby drivers)

To load another driver, use the 'driver' command.
To connect to a database, use the 'connect' command.
E.g.

driver 'foo.bar.db.Driver'\;
connect 'jdbc:foobar:mydb'\;

For embedded Derby, `sql-derby-db-home' defines where the database
found.

The buffer is put in sql-interactive-mode, giving commands for sending
input.  See `sql-interactive-mode'.

To specify a coding system for converting non-ASCII characters in the
input and output to the process, use
\\[universal-coding-system-argument] before \\[sql-derby].  You can
also specify this with \\[set-buffer-process-coding-system] in the SQL
buffer, after you start the process.  The default comes from
`process-coding-system-alist' and `default-process-coding-system'.

\(Type \\[describe-mode] in the SQL buffer for a list of commands.)"
  (interactive)
  (let ((ij-login nil)
        (ij-db-buffer "Derby ij")
        (ij-driver (concat  "-Dij.driver=" sql-ij-driver))
        (ij-home (concat  "-Dderby.system.home=" sql-derby-db-home))
        (ij-classpath sql-ij-classpath)
        (ij-class sql-ij-class)
        (ij-db-comint-buffer nil)) 
    (set-buffer 
     (make-comint ij-db-buffer sql-java-vm nil 
                  ij-driver 
                  ij-home 
                  "-classpath" ij-classpath ij-class))
    (setq sql-prompt-regexp "^ij> ")
    (setq sql-prompt-length 4)
    (setq sql-buffer (current-buffer))
    ;; set sql-mode-font-lock-keywords to something different before
    ;; calling sql-interactive-mode.
    (setq sql-mode-font-lock-keywords sql-mode-derby-font-lock-keywords)
    (sql-interactive-mode)
    (message "Login...done")
    (pop-to-buffer sql-buffer)))

(provide 'ij)
