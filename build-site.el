;; Set the package installation directory
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq packages-archives '(("melpa" . "https://melpa.org/packages/")
                          ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the packages system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install packages
(package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"./other/style.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      '(("orgfiles"
         :recursive t
         :base-directory "./content"
         :base-extension "org"
         :publishing-directory "./public"
         :publishing-function org-html-publish-to-html
         :html-preamble t
         :with-author nil
         :with-creator nil
         :with-toc t
         :section-numbers nil
         :time-stamp-file nil)

        ("htmlfiles"
         :recursive t
         :base-directory "./content"
         :base-extension "html\\|htm"
         :publishing-directory "./public"
         :publishing-function org-publish-attachment)

        ("images"
         :base-directory "./content/images"
         :base-extension "jpg\\|gif\\|png"
         :publishing-directory "./public/images"
         :publishing-function org-publish-attachment)

        ("other"
         :base-directory "./content/other"
         :base-extension "css"
         :publishing-directory "./public/other"
         :publishing-function org-publish-attachment)))

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
