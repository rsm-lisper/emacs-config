;; -*- mode: emacs-lisp -*-

;; melpa - stąd pochodzą pakiety
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; różne zmienne konfiguracyjne:
(custom-set-variables
 '(column-number-mode t)   ; numer kolumny w mode-line
 '(display-time-mode t)    ; bo lubię wiedzieć która godzina
 '(tool-bar-mode nil)      ; tool bar jest bezużyteczny dla mnie
 '(doc-view-continuous t)  ; żeby dokumenty pdf wyświetlały się z miękkim podziałem na strony
 '(global-linum-mode t)    ; wyświetlanie numerów linii
 '(make-backup-files nil)  ; nie twórz plików zapasowych
 '(erc-email-userid "<email>") ; klient irc
 '(erc-nick "<nick>")
 '(erc-user-full-name "<np-imie-nazwisko>")
 '(package-selected-packages   ; potrzebne pakiety, głównie tematy
   (quote
    (moe-theme tangotango-theme leueven-theme w3m gh-md diff-hl ox-gfm markdown-mode slime))))

;; łamanie długich linii
;(setq-default word-wrap t)
(global-visual-line-mode t)

;; emacs org - marginesy (które dla A4 nie chcą sensownie działać)
(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))

;; theme / wygląd
(require 'leueven-theme)
(load-theme 'leueven)

;; wczytujemy włączone moduły
(load "~/emacs.d/mods-enabled/*")

;; start emacs deamon - żeby używać emacsclient
(server-start)
