;;; ui/persp-mode/config.el -*- lexical-binding: t; -*-

(use-package persp-mode
  :general
  (leader-def
    :states 'normal
    "TAB TAB" 'persp-switch
    "TAB c" 'persp-add-new
    "TAB r" 'persp-rename
    "TAB n" 'persp-next
    "TAB p" 'persp-prev
    "TAB k" 'persp-kill)
  :config
  (setq persp-save-dir (concat core/cache-dir "persp/"))
  (persp-mode))
