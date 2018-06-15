;;; soft-dev.el --- wsparcie dla programowania, ogólne, niezależnie od języka

;;; commentary:

;; pozbierane przeze mnie różne mody, razem z konfiguracją, mające w zamyśle tworzyć środowisko developerskie.

;;; code:

;; potrzebne pakiety
(setq package-selected-packages
      (quote
       (auto-complete flx-ido projectile flycheck)))
(package-refresh-contents)
(package-install-selected-packages)


(require 'flx-ido) ;; better search/completion system
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'projectile) ;; zarządzanie projektami
(projectile-mode)

(require 'auto-complete)
(global-auto-complete-mode)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; soft-dev.el ends here
