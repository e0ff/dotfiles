;;; langs/typescript/config.el -*- lexical-binding: t; -*-

(use-package typescript-mode)

(use-package tide
  :config
  (defun my-tide-hook ()
    (tide-setup)
    (tide-hl-identifier-mode))
  (add-hook 'typescript-mode-hook #'my-tide-hook))
