
;;; Pakiety do zainstalowania na start.

;;; Code:

(defvar my-packages '(material-theme tangotango-theme diff-hl flycheck rainbow-delimiters rainbow-identifiers))

(mapcar (lambda (p)
	  (package-install p)
	  (require p))
	my-packages)

;;; install.el ends here
