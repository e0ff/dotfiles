;;; tools/lsp/config.el -*- lexical-binding: t; -*-

(use-package eglot
  :config
  (setq eglot-autoshutdown t)

  (defun maybe-start-eglot ()
    (let ((disabled-modes '(emacs-lisp-mode))) ;; exclude modes from eglot
      (unless (apply 'derived-mode-p disabled-modes)
        (eglot-ensure))))

  (add-hook 'prog-mode-hook #'maybe-start-eglot)

  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode)
                 . ("clangd"
                    "--log=error"
                    "--malloc-trim"
                    "--clang-tidy"
                    "--completion-style=detailed")))

  (add-to-list 'eglot-server-programs '(csharp-mode . ("csharp-ls"))))
