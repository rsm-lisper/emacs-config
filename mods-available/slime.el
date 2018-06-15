;; -*- mode: emacs-lisp -*-

;;;; slime - lisp (common lisp) ide

(setq package-selected-packages
      (quote
       (slime)))
(package-refresh-contents)
(package-install-selected-packages)

(require 'slime)
;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")
(slime-setup '(slime-fancy))
