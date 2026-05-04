;;; langs/elisp/config.el -*- lexical-binding: t; -*-

(use-package elisp-def
  :general
  (general-nmap
   :keymaps 'elisp-def-mode-map
   "gd" 'elisp-def)
  :config
  (add-hook 'emacs-lisp-mode-hook 'elisp-def-mode))

(local-leader-def
  :states 'normal
  :keymaps 'emacs-lisp-mode-map
  "e" '(:ignore t :which-key "eval")
  "eb" 'eval-buffer
  "er" 'eval-region
  "ee" 'eval-expression
  "ed" 'eval-defun)

(define-key emacs-lisp-mode-map (kbd "C-j") 'eval-region)
