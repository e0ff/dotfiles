;; -*- lexical-binding: t; -*-

(use-package smartparens-config
  :straight smartparens
  :config
  (setq sp-base-key-bindings 'paredit
        sp-autoskip-closing-pair 'always
        sp-escape-quotes-after-insert nil)
  (sp-use-paredit-bindings)
  (smartparens-global-mode))
