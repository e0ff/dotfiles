;;; tools/git/config.el -*- lexical-binding: t; -*-

(setq version-control t
      vc-follow-symlinks t)

(use-package diff-hl
  :ensure
  :config
  (global-diff-hl-mode)

  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)

  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package magit
  :ensure
  :general
  (leader-def
    :states 'normal
    "g" '(:ignore t :which-key "Git")
    "gg" 'magit-status
    "gd" 'magit-diff
    "gb" 'magit-blame
    "gl" 'magit-log
    "gr" 'magit-branch
    "gS" 'magit-stage-file
    "g/" 'counsel-git-grep))

(use-package forge)

(use-package git-modes
  :ensure)
