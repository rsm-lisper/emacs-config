;; -*- mode: emacs-lisp -*-

(setq package-selected-packages
      (quote
       (w3m)))
(package-refresh-contents)
(package-install-selected-packages)

(setq browse-url-browser-function 'w3m-browse-url)
