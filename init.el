
;;;; konfiguracja emacsa, część wspólna ;;;;


;; melpa - stąd pochodzą pakiety
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(package-refresh-contents)


(defun require-package (package)
  "Install given PACKAGE."
  (if (package-installed-p package)
      t
    (package-install package)))

(defun require-packages (package-list)
  (if (null package-list)
      t
    (progn
      (require-package (car package-list))
      (require-packages (cdr package-list)))))


;; potrzebne pakiety, głównie tematy
(require-packages '(moe-theme tangotango-theme leuven-theme w3m gh-md ox-gfm))


;; różne zmienne konfiguracyjne:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(doc-view-continuous t)
 '(global-linum-mode t)
 '(make-backup-files nil)
 '(ring-bell-function (quote ignore))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))


;; łamanie długich linii - wizualne całymi wyrazami
(global-visual-line-mode t)

;; emacs org - marginesy (które dla A4 nie chcą sensownie działać)
(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))

;; theme / wygląd
;;(load-theme 'leuven)
(load-theme 'tangotango)

;; fringe - to te paski po bokach z dziwnymi znaczkami
(setq-default indicate-buffer-boundaries 'left)  ; oznaczamy granice bufora
(setq-default indicate-empty-lines +1)           ; oznaczamy puste linie

;; wczytujemy włączone moduły
(mapc 'load (file-expand-wildcards "~/.emacs.d/mods-enabled/*"))

;; start emacs deamon - żeby używać emacsclient
;;(server-start)
