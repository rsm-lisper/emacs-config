
;; additional repos - nongnu and melpa
(require 'package)
;(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/packages/"))
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-blinks 0)
 '(column-number-mode t)
 '(company-quickhelp-color-background "black")
 '(company-quickhelp-color-foreground "white smoke")
 '(company-quickhelp-delay 1.5)
 '(company-quickhelp-mode t)
 '(custom-safe-themes
   '("9f986dcc0de26c1c8b6dfd749eb7351b1a3c8db31b3330a7dfdd25be1b47cb22" default))
 '(doc-view-continuous t)
 '(flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck))
 '(flycheck-gcc-language-standard "c89")
 '(geiser-guile-warning-level 'high)
 '(geiser-mode-smart-tab-p t)
 '(geiser-repl-highlight-output-p t)
 '(geiser-repl-query-on-kill-p nil)
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries 'left)
 '(indicate-empty-lines 1)
 '(inhibit-startup-screen t)
 '(ispell-dictionary nil)
 '(make-backup-files nil)
 '(package-selected-packages
   '(multi-term dired-single orderless marginalia which-key which-key-posframe company-arduino company-c-headers company-ctags company-dict company-flx company-php company-quickhelp company-quickhelp-terminal company-shell company-web slime-company slime-repl-ansi-color slime-theme slime alect-themes solarized-theme graphviz-dot-mode eterm-256color vdiff sr-speedbar moe-theme farmhouse-themes tangotango-theme material-theme leuven-theme vertico markdown-mode php-mode rainbow-blocks flycheck-guile flycheck rainbow-identifiers rainbow-delimiters dired-rainbow diff-hl geiser-guile geiser-racket js2-mode))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-default-width 25)
 '(sr-speedbar-right-side nil)
 '(term-unbind-key-list '("C-T" "C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>"))
 '(tool-bar-mode nil)
 '(vertico-mode t)
 '(warning-suppress-types '((comp))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 120 :width normal)))))

(if (window-system)
    (set-frame-width (selected-frame) 140))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(load-theme 'moe-dark)

;;;; sr-speedbar
;;(require 'sr-speedbar)
;;(sr-speedbar-open)
;;(switch-to-buffer "*scratch*")

(require 'which-key)
(which-key-mode)

;;;; ansi-term 256 color support
(require 'eterm-256color)
(add-hook 'term-mode-hook #'eterm-256color-mode)
;;;; ansi-term [C-T] key binding and default shell
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq term-unbind-key-list (cons "C-T" term-unbind-key-list))
(global-set-key "\C-T" 'multi-term)


(require 'vertico)
(add-hook 'after-init-hook 'vertico-mode)
;;;(vertico-mode)

(require 'marginalia)
(add-hook 'after-init-hook 'marginalia-mode)

(require 'orderless)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;;;; diff highlight - code versioning highligh
(require 'diff-hl)
(global-diff-hl-mode)   ; enables diff-hl for all buffers
(diff-hl-flydiff-mode)  ; enables diff on the fly - no need to save file to see changes
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)  ; adds diff-hl to dired

;;;; similar to meld - code comparison side by side
(require 'vdiff)
(define-key vdiff-mode-map (kbd "C-c") vdiff-mode-prefix-map)

;;;; check code on the fly
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;;(add-hook 'prog-mode-hook #'rainbow-identifiers-mode)

;;;; guile
(require 'geiser-guile)
(require 'flycheck-guile)
(setenv "GUILE_LOAD_PATH"
        (string-join
         (list
	  (concat (getenv "HOME") "/proj")
          (concat (getenv "HOME") "/guile-libs"))
         ":"))
;;;; ..and racket
(require 'geiser-racket)

;;;; slime (for common lisp)
(require 'slime)
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
(require 'slime-company)

;;;; javascript
;;(require 'js2-mode)
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
