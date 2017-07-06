;; -*- mode: emacs-lisp -*-


;; melpa - stąd pochodzą pakiety
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; różne zmienne konfiguracyjne:
(custom-set-variables
 '(column-number-mode t)   ; numer kolumny w mode-line
 '(display-time-mode t)    ; bo lubię wiedzieć która godzina
 '(tool-bar-mode nil)      ; tool bar jest bezużyteczny dla mnie
 '(doc-view-continuous t)  ; żeby dokumenty pdf wyświetlały się z miękkim podziałem na strony
 '(global-linum-mode t)    ; wyświetlanie numerów linii po lewej
 '(erc-email-userid "<email>") ; klient irc
 '(erc-nick "<nick>")
 '(erc-user-full-name "<np-imie-nazwisko>")
 '(package-selected-packages   ; potrzebne pakiety, głównie tematy
   (quote
    (moe-theme monokai-alt-theme monokai-theme alect-themes tangotango-theme w3m gh-md diff-hl ox-gfm markdown-mode slime))))

;; slime - lisp ide
;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")
(slime-setup '(slime-fancy))

;; diff highlight - oznaczanie zmian na podstawie repo (poprzez vc więc obsługuje różne)
(global-diff-hl-mode)   ; włącza diff-hl dla wszystkich buforów
(diff-hl-flydiff-mode)  ; włącza diff w locie - nie trzeba zapisywać pliku żeby widział zmiany
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)  ; dodaje diff-hl w dired

;; fringe - to te paski po bokach z dziwnymi znaczkami
(setq-default indicate-buffer-boundaries 'left)  ; oznaczamy granice bufora
(setq-default indicate-empty-lines +1)           ; oznaczamy puste linie

;; emacs org - marginesy (które dla A4 nie chcą sensownie działać)
(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))

;; theme / wygląd
(require 'tangotango-theme)
(load-theme 'tangotango)

;; start emacs deamon - żeby używać emacsclient
(server-start)
