
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
   (quote
    ("e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "170bb47b35baa3d2439f0fd26b49f4278e9a8decf611aa33a0dad1397620ddc3" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "a77ced882e25028e994d168a612c763a4feb8c4ab67c5ff48688654d0264370c" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "713f898dd8c881c139b62cf05b7ac476d05735825d49006255c0a31f9a4f46ab" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" default)))
 '(display-time-mode t)
 '(doc-view-continuous t)
 '(fringe-mode 4 nil (fringe))
 '(geiser-guile-warning-level (quote high))
 '(global-linum-mode t)
 '(make-backup-files nil)
 '(ring-bell-function (quote ignore))
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
