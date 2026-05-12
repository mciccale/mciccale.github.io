(require 'ox-publish)

(setq org-publish-project-alist
      '(("content"
	     :recursive t
	     :base-directory "."
	     :base-extension "org"
	     :publishing-directory "./public_html"
	     :publishing-function org-html-publish-to-html
	     :with-author nil
	     :with-creator t
	     :with-toc nil
	     :section-numbers nil
	     :html-validation-link nil)

	    ("static"
	     :base-directory "."
	     :publishing-directory "./public_html"
	     :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	     :publishing-function org-publish-attachment)))

(setq org-html-head-include-scripts nil
      org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\"")

(setq org-export-global-macros
      '((el . "@@html:<$1 class=\"$2\">$3</$1>@@")
        (bf . "{{{el(span,bf,$1)}}}")
        (it . "{{{el(span,it,$1)}}}")
        (tt . "{{{el(span,tt,$1)}}}")
        (sc . "{{{el(span,sc,$1)}}}")
        (sf . "{{{el(span,sf,$1)}}}")
        (ul . "{{{el(span,ul,$1)}}}")
        (cliplab . "{{{ul(C)}}}omputational logic, \
{{{ul(L)}}}anguages, \
{{{ul(I)}}}mplementation, and \
{{{ul(P)}}}arallelism {{{ul(L)}}}{{{el(span,ul sc,ab)}}}oratory")))

(setq org-html-postamble t
      org-html-postamble-format
      '(("en" "<div class=\"hr\"></div><p class=\"creator\">Created using: %c</p>")))

(org-publish-all t)
(message "Build complete!")
