(use-package eglot
  :config
  (setq eglot-autoshutdown t)

  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'go-mode-hook 'eglot-ensure)
  (add-hook 'rust-mode-hook 'eglot-ensure)
  (add-hook 'csharp-mode-hook 'eglot-ensure)

  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode)
                 . ("clangd"
                    "--log=error"
                    "--malloc-trim"
                    "--clang-tidy"
                    "--completion-style=detailed")))

  (add-to-list 'eglot-server-programs '(csharp-mode . ("csharp-ls"))))
