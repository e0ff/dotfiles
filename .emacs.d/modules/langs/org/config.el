;;; langs/org/config.el -*- lexical-binding: t; -*-

(local-leader-def
  :states 'normal
  :map 'org-mode-map
  "e" 'org-export-dispatch)
