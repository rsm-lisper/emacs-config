;; -*- mode: emacs-lisp -*-

(setq package-selected-packages
      (quote
       (diff-hl magit magithub)))
(package-refresh-contents)
(package-install-selected-packages)

;;;; diff highlight - oznaczanie zmian na podstawie repo (poprzez vc więc obsługuje różne)

(global-diff-hl-mode)   ; włącza diff-hl dla wszystkich buforów
(diff-hl-flydiff-mode)  ; włącza diff w locie - nie trzeba zapisywać pliku żeby widział zmiany
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)  ; dodaje diff-hl w dired

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(require 'magithub)
