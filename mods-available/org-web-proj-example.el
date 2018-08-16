;; -*- mode: emacs-lisp -*-

;; przykładowy projekt web'owy w org'u, z obsługą treści dynamicznych i plików statycznych.
;; do <wypełnienia>.

(setq package-selected-packages
      (quote
       (ox-publish)))
(package-refresh-contents)
(package-install-selected-packages)

(require 'ox-publish)
(setq org-publish-use-timestamps-flag nil)
(setq org-publish-project-alist
      '(("<proj-name-dyn>"
	 :base-directory "<source-org-path>"
	 :base-extension "org"
	 :publishing-directory "<destination-html-path>"
	 :publishing-function org-html-publish-to-html
	 :recursive t
	 :exclude "TODO.org\\|CHANGELOG.org"
	 :headline-levels 4
	 :section-numbers nil
	 :preserve-breaks t
	 :author "<first-last-name>"
	 :with-author t
	 :with-creator t
	 :time-stamp-file nil
	 :with-email nil
	 :with-title nil
	 :with-toc nil
	 :language "pl"
	 :html-head-include-scripts t
	 :html-head-include-default-style t
	 :html-head "<link rel=\"stylesheet\" href=\"/<file-name.css>\" type=\"text/css\" />"
	 :html-link-home "/"
	 :html-link-up "."
	 :html-preamble "<page-header-html>"
	 :html-postamble "<page-footer-html>"
	 )
	("<proj-name-static>"
	 :base-directory "<source-path>"
	 :base-extension "css\\|js\\|png\\|gif\\|jpg\\|pdf\\|txt"
	 :publishing-directory "<destination-path>"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("<proj-name>" :components ("<proj-name-dyn>" "<proj-name-static>"))))
