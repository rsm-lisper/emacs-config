;;; code:

;; potrzebne pakiety
;; pozbierane przeze mnie różne mody, razem z konfiguracją, mające w zamyśle tworzyć środowisko developerskie.

(require-packages '(dumb-jump auto-complete flx-ido projectile flycheck))


(require 'dumb-jump)
(dumb-jump-mode)

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
