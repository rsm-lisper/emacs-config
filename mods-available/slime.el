;; -*- mode: emacs-lisp -*-

;;;; slime - lisp (common lisp) ide

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")
(slime-setup '(slime-fancy))
