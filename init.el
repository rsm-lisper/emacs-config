;; -*- mode: emacs-lisp -*-

;; melpa - stąd pochodzą pakiety
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; potrzebne pakiety, głównie tematy
(setq package-selected-packages
      (quote
       (moe-theme tangotango-theme leuven-theme w3m gh-md diff-hl ox-gfm markdown-mode slime)))
(package-refresh-contents)
(package-install-selected-packages)

;; różne zmienne konfiguracyjne:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" default)))
 '(display-time-mode t)
 '(doc-view-continuous t)
 '(erc-email-userid "<email>")
 '(erc-nick "<nick>")
 '(erc-user-full-name "<np-imie-nazwisko>")
 '(global-linum-mode t)
 '(make-backup-files nil)
 '(tool-bar-mode nil))

;; łamanie długich linii
;(setq-default word-wrap t)
(global-visual-line-mode t)

;; emacs org - marginesy (które dla A4 nie chcą sensownie działać)
(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))

;; theme / wygląd
(load-theme 'leuven)

;; wczytujemy włączone moduły
(mapc 'load (file-expand-wildcards "~/.emacs.d/mods-enabled/*"))

;; start emacs deamon - żeby używać emacsclient
(server-start)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
