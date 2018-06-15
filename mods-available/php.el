;;; php.el --- support for php development

;;; commentary:
;;
;; pozbierane przeze mnie różne mody, razem z konfiguracją, mające w zamyśle tworzyć środowisko developerskie do php.

;;; code:

;; potrzebne pakiety
(setq package-selected-packages
      (quote
       (php-mode web-mode ac-php feature-mode quickrun)))
(package-refresh-contents)
(package-install-selected-packages)

(require 'php-mode)
(setq php-lineup-cascaded-calls t)
(setq php-template-compatibility nil) ;; nie probuj obslugiwac html'a (tym zajmuje sie web-mode)

(require 'web-mode) ;; obsługuje html'a itp
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'feature-mode) ;; for plain text user stories (ie behat)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(require 'flycheck)
(setq php-executable "/usr/bin/php")

(require 'ac-php)
(global-auto-complete-mode)
(ac-php-core-eldoc-setup)

;;(require 'quickrun)

;; klawiszologia:
;; C-c C-f :: search php documentation
;; C-c C-r :: (php-send-region) execute the selected php region (output in *PHP* buff)

;;; php.el ends here
