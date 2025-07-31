;;; tools/tree-sitter/config.el -*- lexical-binding: t; -*-

(setq treesit-font-lock-level 4)

(use-package treesit-auto
  :ensure
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
