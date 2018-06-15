;;; init.el --- konfiguracja wspólna

;;; commentary:

;; konfiguracja emacs'a, część wspólna

;;; code:

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
       (moe-theme tangotango-theme leuven-theme w3m gh-md ox-gfm)))
(package-refresh-contents)
(package-install-selected-packages)

;; różne zmienne konfiguracyjne:
(custom-set-variables
 '(column-number-mode t)
 '(display-time-mode t)
 '(doc-view-continuous t)
 '(global-linum-mode t)
 '(make-backup-files nil)
 '(tool-bar-mode nil))

;; łamanie długich linii - wizualne całymi wyrazami
(global-visual-line-mode t)

;; emacs org - marginesy (które dla A4 nie chcą sensownie działać)
(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))

;; theme / wygląd
(load-theme 'leuven)

;; fringe - to te paski po bokach z dziwnymi znaczkami
(setq-default indicate-buffer-boundaries 'left)  ; oznaczamy granice bufora
(setq-default indicate-empty-lines +1)           ; oznaczamy puste linie

;; wczytujemy włączone moduły
(mapc 'load (file-expand-wildcards "~/.emacs.d/mods-enabled/*"))

;; start emacs deamon - żeby używać emacsclient
(server-start)

;;; init.el ends here
