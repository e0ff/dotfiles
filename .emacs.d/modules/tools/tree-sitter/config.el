;;; tools/tree-sitter/config.el -*- lexical-binding: t; -*-

(setq treesit-font-lock-level 4)

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (setq treesit-auto-langs '(c cpp gitcommit sql python go gomod html css javascript typescript json rust markdown typst))
  (global-treesit-auto-mode))
