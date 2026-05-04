;;; langs/go/config.el -*- lexical-binding: t; -*-

(use-package go-mode
  :mode ("\\.go\\'" . go-mode)
  :commands go-mode
  :config
  (if (executable-find "goimports")
      (setq gofmt-command "goimports"))
  (add-hook 'go-mode-hook 'subword-mode)
  (add-hook 'before-save-hook 'gofmt-before-save))
