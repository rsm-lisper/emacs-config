;; -*- mode: emacs-lisp -*-

;;;; diff highlight - oznaczanie zmian na podstawie repo (poprzez vc więc obsługuje różne)

(global-diff-hl-mode)   ; włącza diff-hl dla wszystkich buforów
(diff-hl-flydiff-mode)  ; włącza diff w locie - nie trzeba zapisywać pliku żeby widział zmiany
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)  ; dodaje diff-hl w dired