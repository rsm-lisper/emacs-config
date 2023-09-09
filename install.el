 
;;; Pakiety do zainstalowania na start.

;;; Code:

(defvar my-packages '(material-theme tangotango-theme diff-hl flycheck geiser-guile flycheck-guile geiser-racket rainbow-delimiters rainbow-identifiers js2-mode))

(package-refresh-contents)

(mapcar (lambda (p)
	  (package-install p)
	  (require p))
	my-packages)

;;; install.el ends here
