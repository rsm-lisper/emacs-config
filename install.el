 
;;; Pakiety do zainstalowania na start.

;;; Code:

(defvar my-packages
   '(vertico company-fuzzy company farmhouse-themes realgud markdown-mode php-mode tangotango-theme rainbow-blocks flycheck rainbow-identifiers rainbow-delimiters dired-rainbow material-theme leuven-theme diff-hl geiser-guile geiser-racket js2-mode))


(package-refresh-contents)

(mapcar (lambda (p)
	  (package-install p)
	  (require p))
	my-packages)

;;; install.el ends here
