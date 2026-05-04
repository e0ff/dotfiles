;;; langs/javascript/config.el -*- lexical-binding: t; -*-

(setq js-indent-level 2)

(use-package js2-mode
  :config
  (setq js2-chain-indents t
        js2-basic-offset 2
        js2-skip-preprocessor-directives t
        js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil)
  (add-hook 'js-mode-hook 'js2-minor-mode)
  (add-hook 'web-mode-hook 'js2-minor-mode))
