;;; lang/csharp/config.el -*- lexical-binding: t; -*-

(use-package csproj-mode
  :ensure)

(use-package sharper
  :ensure
  :general
  (local-leader-def
    :states 'normal
    :keymaps 'csharp-mode-map
    "d" 'sharper-main-transient))

(add-to-list 'auto-mode-alist '("\\.xaml\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.axaml\\'" . xml-mode))
