;; -*- mode: emacs-lisp -*-


;; melpa - stąd pochodzą pakiety
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)



(custom-set-variables
 '(custom-safe-themes   ; leuven jest dobry, leuven może się uruchamiać, pozwalam
   (quote
    ("d5f17ae86464ef63c46ed4cb322703d91e8ed5e718bf5a7beb69dd63352b26b2" default)))
 '(display-time-mode t)    ; bo lubię wiedzieć która godzina
 '(tool-bar-mode nil))     ; tool bar jest bezużyteczny dla mnie


;; bo to dobry theme jest
(require 'leuven-theme)
(load-theme 'leuven)


;; fringe - to te paski po bokach z dziwnymi znaczkami
(setq-default indicate-buffer-boundaries 'left)  ; oznaczamy granice bufora
(setq-default indicate-empty-lines +1)           ; oznaczamy puste linie


;; emacs org
(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))


;; ruby, rails i przyjaciele
;; enhanced-ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode" "major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; emacs-pry
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
(require 'pry)
;; optionals
(global-set-key [S-f9] 'pry-intercept)
(global-set-key [f9] 'pry-intercept-rerun)

;; rinari - pomaga w nawigowaniu po rails
(require 'rinari)
(global-rinari-mode +1)


;; diff highlight - oznaczanie zmian na podstawie repo (poprzez vc więc obsługuje różne)
(global-diff-hl-mode)   ; włącza diff-hl dla wszystkich buforów
(diff-hl-flydiff-mode)  ; włącza diff w locie - nie trzeba zapisywać pliku żeby widział zmiany
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)  ; dodaje diff-hl w dired

;; robe-mode
;(add-hook 'ruby-mode-hook 'robe-mode)
;(add-hook 'robe-mode-hook 'ac-robe-setup)
