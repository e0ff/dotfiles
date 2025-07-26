;;; tools/dap/config.el -*- lexical-binding: t; -*-

(use-package dape
  :general
  (leader-def
    :states 'normal
    :keymaps 'prog-mode-map
    "d" '(:ignore t :which-key "debugger")
    "dd" 'dape
    "db" 'dape-breakpoint-toggle
    "dr" 'dape-repl
    "dc" 'dape-continue
    "di" 'dape-step-in
    "do" 'dape-step-out
    "dw" 'dape-watch-dwim
    "dq" 'dape-quit))
