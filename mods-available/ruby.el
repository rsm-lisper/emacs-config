;; -*- mode: emacs-lisp -*-

;; ruby, rails i przyjaciele

(setq package-selected-packages
      (quote
       (pry rinari)))
(package-refresh-contents)
(package-install-selected-packages)


;; enhanced-ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode" "major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; emacs-pry
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
(require 'pry)
;; optionals
(global-set-key [S-f9] 'pry-intercept)
(global-set-key [f9] 'pry-intercept-rerun)

;; rinari - pomaga w nawigowaniu po rails
(require 'rinari)
(global-rinari-mode +1)

;; robe-mode
;(add-hook 'ruby-mode-hook 'robe-mode)
;(add-hook 'robe-mode-hook 'ac-robe-setup)
