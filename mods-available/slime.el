;; -*- mode: emacs-lisp -*-

;;;; slime - lisp (common lisp) ide

(require-package 'slime)

(require 'slime)
;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(slime-setup '(slime-fancy))
