
(defun install ()
  (interactive)
  (package-refresh-contents)
  (package-install-selected-packages))

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
   '("e3999eba4f25d912d7d61cbaaed1b551957e61da047279da89499d3bd1f1d007" default))
 '(doc-view-continuous t)
 '(geiser-guile-warning-level 'high)
 '(geiser-mode-smart-tab-p t)
 '(geiser-repl-highlight-output-p t)
 '(geiser-repl-query-on-kill-p nil)
 '(global-company-fuzzy-mode t nil (company-fuzzy))
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries 'left)
 '(indicate-empty-lines 1)
 '(inhibit-startup-screen t)
 '(ispell-dictionary nil)
 '(make-backup-files nil)
 '(package-selected-packages
   '(moe-theme farmhouse-themes tangotango-theme material-theme leuven-theme vertico company-fuzzy company markdown-mode php-mode rainbow-blocks flycheck-guile flycheck rainbow-identifiers rainbow-delimiters dired-rainbow diff-hl geiser-guile geiser-racket js2-mode))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vertico-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(load-theme 'material)
(load-theme 'moe-dark)
;;(load-theme 'tangotango)
;;(load-theme 'farmhouse-dark)

;;;; diff highlight - oznaczanie zmian na podstawie repo (poprzez vc więc obsługuje różne)
(require 'diff-hl)
(global-diff-hl-mode)   ; włącza diff-hl dla wszystkich buforów
(diff-hl-flydiff-mode)  ; włącza diff w locie - nie trzeba zapisywać pliku żeby widział zmiany
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)  ; dodaje diff-hl w dired

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;;(add-hook 'prog-mode-hook #'rainbow-identifiers-mode)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;;;; guile
(require 'geiser-guile)
(require 'flycheck-guile)
(setenv "GUILE_LOAD_PATH"
	(concat (getenv "HOME") "/proj"))
;;;; ..and racket
(require 'geiser-racket)

;;;; javascript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
