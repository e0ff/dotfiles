;;; langs/typst/config.el -*- lexical-binding: t; -*-

(use-package typst-ts-mode
  :general
  (local-leader-def
    :states 'normal
    :keymaps 'typst-ts-mode-map
    "p" 'typst-ts-compile-and-preview))
