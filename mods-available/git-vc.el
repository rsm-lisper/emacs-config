;; -*- mode: emacs-lisp -*-

(require-packages '(diff-hl magit magit-popup forge))

;;;; diff highlight - oznaczanie zmian na podstawie repo (poprzez vc więc obsługuje różne)

(global-diff-hl-mode)   ; włącza diff-hl dla wszystkich buforów
(diff-hl-flydiff-mode)  ; włącza diff w locie - nie trzeba zapisywać pliku żeby widział zmiany
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)  ; dodaje diff-hl w dired

(require 'magit)
(require 'magit-popup)
(require 'forge)
(global-set-key (kbd "C-x g") 'magit-status)
