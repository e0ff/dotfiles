;; -*- lexical-binding: t; -*-

(use-package zone-nyan)

(use-package emojify
  :config
  (setq emojify-emojis-dir (concat core/cache-dir "emojis"))
  (add-hook 'text-mode-hook 'emojify-mode)
  (add-hook 'markdown-mode-hook 'emojify-mode)
  (add-hook 'org-mode-hook 'emojify-mode)
  (add-hook 'erc-mode-hook 'emojify-mode))
