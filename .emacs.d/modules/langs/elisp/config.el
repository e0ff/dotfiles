;;; langs/elisp/config.el -*- lexical-binding: t; -*-

(local-leader-def
  :states 'normal
  :keymaps 'emacs-lisp-mode-map
  "e" '(:ignore t :which-key "eval")
  "eb" 'eval-buffer
  "er" 'eval-region
  "ee" 'eval-expression
  "ed" 'eval-defun)
