(setq user-full-name "Urban Avsec"
      user-mail-address "urban.avsec@outlook.com")

(setq doom-theme 'doom-city-lights)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/iCloud/3. MyBrain")

(use-package! org-ref
  :config
  (setq
   org-ref-completion-library 'org-ref-ivy-cite
   org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-help-bibtex
   org-ref-default-bibliography (list "~/iCloud/Library/Library.bib")))

(after! org-ref
  (setq
   bibtex-completion-notes-path "~/iCloud/3. MyBrain/SourceNotes/"
   bibtex-completion-bibliography "~/iCLoud/Library/Library.bib"
   bibtex-completion-pdf-field "file"))

(use-package! org-roam
    :after org
    :init
    (map! :leader
          (:prefix-map ("n" . "notes")
           (:prefix ("r" . "roam")
            :desc "Find Roam Node"                      "/" #'org-roam-node-find)))
    :commands
    (org-roam-buffer
     org-roam-setup
     org-roam-capture
     org-roam-node-find)
    :config
    (setq org-roam-directory "~/iCloud/3. MyBrain")
    (org-roam-setup))

(after! org-roam
  (setq org-roam-capture-templates
        '(("n" "Default Note" plain "%?"
           :if-new (file+head "%<%Y&m&d&H&M&S>-${slug}.org"
                              "#+TITLE: ${title}\n")
           :unnarrowed t)
          ("s" "Source Note" plain "%s?"
           :if-new (file+head "LiteratureNotes/${citekey.org}"
                              "#+TITLE: ${title}\n"
                              "#+ROAM_KEY: ${citekey.org}")))))

(use-package! org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config)
