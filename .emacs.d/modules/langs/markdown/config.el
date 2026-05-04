;;; langs/markdown/config.el -*- lexical-binding: t; -*-

(use-package markdown-mode
  :commands markdown-mode
  :mode ("\\.\\(md\\|markdown\\)\\'" . markdown-mode)
  :config
  (add-hook 'markdown-mode-hook 'auto-fill-mode)
  (add-hook 'markdown-mode-hook 'visual-line-mode)
  (add-hook 'markdown-mode-hook 'my/set-fill-column)
  (add-hook 'markdown-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends) '(company-ispell company-files)))))
