;; -*- mode: common-lisp -*-

;;;; erc - klient irc

(setq package-selected-packages
      (quote
       (erc)))
(package-refresh-contents)
(package-install-selected-packages)


(custom-set-variables
 '(erc-email-userid "<email>")
 '(erc-nick "<nick>")
 '(erc-user-full-name "<np-imie-nazwisko>"))
