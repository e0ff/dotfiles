;;; langs/rust/config.el -*- lexical-binding: t; -*-

(use-package rustic
  :config
  (setq rustic-format-on-save t)
  (setq rustic-lsp-client 'eglot))

(use-package cargo
  :general
  (local-leader-def
    :states 'normal
    :keymaps 'rust-mode-map
    "cc" 'cargo-process-build
    "cr" 'cargo-process-run
    "ct" 'cargo-process-test))
