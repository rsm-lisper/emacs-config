
;;;; konfiguracja emacsa, część wspólna ;;;;


;; melpa - stąd pochodzą pakiety
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(package-refresh-contents)


(defun require-package (pkg)
  "Install and require given PKG."
  (if (package-installed-p pkg)
      t
    (package-install pkg)))

(defun require-packages (package-list)
  (if (null package-list)
      t
    (progn
      (require-package (car package-list))
      (require-packages (cdr package-list)))))


;; potrzebne pakiety, głównie tematy
(require-packages '(leuven-theme moe-theme tangotango-theme gh-md ox-gfm))


;; różne zmienne konfiguracyjne:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("43cadc6254cf27ff544e044b4139a7d50cf44e107cffef255aa8c5943581f606" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "170bb47b35baa3d2439f0fd26b49f4278e9a8decf611aa33a0dad1397620ddc3" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "a77ced882e25028e994d168a612c763a4feb8c4ab67c5ff48688654d0264370c" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "713f898dd8c881c139b62cf05b7ac476d05735825d49006255c0a31f9a4f46ab" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" default))
 '(display-time-mode t)
 '(doc-view-continuous t)
 '(fringe-mode 4 nil (fringe))
 '(geiser-guile-warning-level 'high)
 '(global-linum-mode t)
 '(make-backup-files nil)
 '(ring-bell-function 'ignore)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))


;; łamanie długich linii - wizualne całymi wyrazami
(global-visual-line-mode t)

;; emacs org - marginesy (które dla A4 nie chcą sensownie działać)
(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))

;; theme / wygląd
;;(load-theme 'leuven)
(load-theme 'tangotango)

;; fringe - to te paski po bokach z dziwnymi znaczkami
(setq-default indicate-buffer-boundaries 'left)  ; oznaczamy granice bufora
(setq-default indicate-empty-lines +1)           ; oznaczamy puste linie


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; software development:

;; guile scheme - geiser:
(require-package 'geiser)
(require 'geiser)

;;;; slime - lisp (common lisp) ide:
(require-package 'slime)
(require 'slime)
;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(slime-setup '(slime-fancy))

;; ;;;; php:
;; (require-packages '(php-mode web-mode ac-php feature-mode flycheck quickrun))
;; (require 'php-mode)
;; (setq php-lineup-cascaded-calls t)
;; (setq php-template-compatibility nil) ;; nie probuj obslugiwac html'a (tym zajmuje sie web-mode)
;; (require 'web-mode) ;; obsługuje html'a itp
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (require 'feature-mode) ;; for plain text user stories (ie behat)
;; (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
;; (require 'flycheck)
;; (global-flycheck-mode)
;; (setq php-executable "/usr/bin/php")
;; (require 'ac-php)
;; (global-auto-complete-mode)
;; (ac-php-core-eldoc-setup)
;; ;;(require 'quickrun)
;; ;; klawiszologia:
;; ;; C-c C-f :: search php documentation
;; ;; C-c C-r :: (php-send-region) execute the selected php region (output in *PHP* buff)

;; ;; pozbierane przeze mnie różne mody, razem z konfiguracją, mające w zamyśle tworzyć środowisko developerskie.
;; (require-packages '(dumb-jump auto-complete flx-ido projectile flycheck))
;; (require 'dumb-jump)
;; (dumb-jump-mode)
;; (require 'flx-ido) ;; better search/completion system
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (flx-ido-mode 1)
;; ;; disable ido faces to see flx highlights
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-faces nil)
;; (require 'projectile) ;; zarządzanie projektami
;; (projectile-mode)
;; (require 'auto-complete)
;; (global-auto-complete-mode)
;; (require 'flycheck)
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;;;; diff highlight - oznaczanie zmian na podstawie repo (poprzez vc więc obsługuje różne)
(require-package 'diff-hl)
(require 'diff-hl)
(global-diff-hl-mode)   ; włącza diff-hl dla wszystkich buforów
(diff-hl-flydiff-mode)  ; włącza diff w locie - nie trzeba zapisywać pliku żeby widział zmiany
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)  ; dodaje diff-hl w dired

;; ;;;; magit:
;; (require-packages '(magit magit-popup forge))
;; (require 'magit)
;; (require 'magit-popup)
;; (require 'forge)
;; (global-set-key (kbd "C-x g") 'magit-status)


;;;;;;;;;;;;;;;;;;
;;;; tools/apps:

;; ;;;; erc - klient irc:
;; (require-package 'erc)
;; (custom-set-variables
;;  '(erc-email-userid "<email>")
;;  '(erc-nick "<nick>")
;;  '(erc-user-full-name "<np-imie-nazwisko>"))

;; ;;;; desktop load/save:
;; ;; to create desktop snapshot: M-x desktop-save
;; (desktop-load-default)
;; (desktop-read)

;; ;;;; browse in w3m:
;; (require-package 'w3m)
;; (setq browse-url-browser-function 'w3m-browse-url)

;; ;;;; appointments:
;; (appt-activate)
;; (setq appt-display-mode-line t)
;; (setq appt-message-warning-time 60)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; przykładowy projekt web'owy w org'u, z obsługą treści dynamicznych i plików statycznych:
;; (setq package-selected-packages
;;       (quote
;;        (ox-publish)))
;; (package-refresh-contents)
;; (package-install-selected-packages)
;; (require 'ox-publish)
;; (setq org-publish-use-timestamps-flag nil)
;; (setq org-publish-project-alist
;;       '(("<proj-name-dyn>"
;; 	 :base-directory "<source-org-path>"
;; 	 :base-extension "org"
;; 	 :publishing-directory "<destination-html-path>"
;; 	 :publishing-function org-html-publish-to-html
;; 	 :recursive t
;; 	 :exclude "TODO.org\\|CHANGELOG.org"
;; 	 :headline-levels 4
;; 	 :section-numbers nil
;; 	 :preserve-breaks t
;; 	 :author "<first-last-name>"
;; 	 :with-author t
;; 	 :with-creator t
;; 	 :time-stamp-file nil
;; 	 :with-email nil
;; 	 :with-title nil
;; 	 :with-toc nil
;; 	 :language "pl"
;; 	 :html-head-include-scripts t
;; 	 :html-head-include-default-style t
;; 	 :html-head "<link rel=\"stylesheet\" href=\"/<file-name.css>\" type=\"text/css\" />"
;; 	 :html-link-home "/"
;; 	 :html-link-up "."
;; 	 :html-preamble "<page-header-html>"
;; 	 :html-postamble "<page-footer-html>"
;; 	 )
;; 	("<proj-name-static>"
;; 	 :base-directory "<source-path>"
;; 	 :base-extension "css\\|js\\|png\\|gif\\|jpg\\|pdf\\|txt"
;; 	 :publishing-directory "<destination-path>"
;; 	 :recursive t
;; 	 :publishing-function org-publish-attachment
;; 	 )
;; 	("<proj-name>" :components ("<proj-name-dyn>" "<proj-name-static>"))))

