 
;;; Code:

;; dodatkowe repo pakietów - nongnu i melpa
(require 'package)
;(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/packages/"))
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   '("82225f1fa1e4d3b00c63700f691fc0dc7c9bdab8a996e6a78f451f9a15bd74fc" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" default))
 '(doc-view-continuous t)
 '(geiser-guile-warning-level 'high)
 '(geiser-repl-highlight-output-p t)
 '(geiser-repl-query-on-kill-p nil)
 '(global-linum-mode t)
 '(indicate-buffer-boundaries 'left)
 '(indicate-empty-lines 1)
 '(inhibit-startup-screen t)
 '(ispell-dictionary nil)
 '(make-backup-files nil)
 '(package-selected-packages
   '(tangotango-theme rainbow-blocks flycheck rainbow-identifiers rainbow-delimiters dired-rainbow material-theme leuven-theme diff-hl geiser-guile))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'material)
(load-theme 'tangotango)

;;;; diff highlight - oznaczanie zmian na podstawie repo (poprzez vc więc obsługuje różne)
;;(require-package 'diff-hl)
(require 'diff-hl)
(global-diff-hl-mode)   ; włącza diff-hl dla wszystkich buforów
(diff-hl-flydiff-mode)  ; włącza diff w locie - nie trzeba zapisywać pliku żeby widział zmiany
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)  ; dodaje diff-hl w dired

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-identifiers-mode)

;;;; guile
(require 'geiser-guile)
(require 'flycheck-guile)
(setenv "GUILE_LOAD_PATH"
	(concat (getenv "HOME") "/proj:" (getenv "HOME") "/guile-libs"))

;;; init.el ends here
