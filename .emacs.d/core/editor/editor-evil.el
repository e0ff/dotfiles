;; -*- lexical-binding: t; -*-

(use-package evil
  :demand
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ;; disable for evil-collection
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-tree)
  :config
  (setq evil-normal-state-cursor '("white" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
  (setq evil-visual-state-cursor '("purple" box))
  (setq evil-replace-state-cursor '("red" hbar))
  (setq evil-motion-state-cursor '("orange" box))

  (setq evil-vsplit-window-right t)

  (evil-set-initial-state 'snake-mode 'emacs)
  (evil-set-initial-state 'stacktrace-mode 'emacs)

  (evil-set-initial-state 'term-mode 'insert)
  (evil-set-initial-state 'shell-mode 'insert)
  (evil-set-initial-state 'eshell-mode 'insert)
  (evil-set-initial-state 'erc-mode 'insert)

  (evil-ex-define-cmd "W" 'evil-write)
  (evil-ex-define-cmd "Q" 'evil-quit)

  (modify-syntax-entry ?_ "w")

  (evil-mode 1))

(use-package evil-collection
  :after evil
  :demand
  :config
  (setq evil-collection-company-use-tng nil)
  (evil-collection-init))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-visualstar
  :config
  (global-evil-visualstar-mode t))

(use-package evil-commentary
  :diminish evil-commentary-mode
  :config
  (add-hook 'prog-mode-hook 'evil-commentary-mode))

(use-package evil-smartparens
  :after smartparens
  :diminish evil-smartparens-mode
  :config
  (add-hook 'smartparens-mode-hook 'evil-smartparens-mode))

(unless (display-graphic-p)
  (xterm-mouse-mode)
  (use-package evil-terminal-cursor-changer
    :config
    (evil-terminal-cursor-changer-activate)))

(use-package evil-snipe
  :config
  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

(use-package evil-goggles
  :config
  (setq evil-goggles-pulse nil
  		evil-goggles-async-duration 0.1
        evil-goggles-blocking-duration 0.05)
  (evil-goggles-mode)
  (with-eval-after-load 'magit
    (evil-goggles-use-magit-faces)))

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/cache/undo")))
  (add-hook 'evil-local-mode-hook 'turn-on-undo-tree-mode)
  (global-undo-tree-mode))

(provide 'editor-evil)
