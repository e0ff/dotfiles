;;; core-packages.el --- description -*- lexical-binding: t; -*-

(require 'core-variables)

(use-package ivy
  :ensure
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode))

(use-package counsel
  :ensure)

(use-package immortal-scratch
  :ensure
  :config
  (immortal-scratch-mode))

(use-package ibuffer
  :bind
  ("C-x C-b" . ibuffer-other-window)
  :config
  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (ibuffer-auto-mode 1)
              (ibuffer-switch-to-saved-filter-groups "default")))
  (setq ibuffer-show-empty-filter-groups nil)
  (setq ibuffer-saved-filter-groups
        (quote (("default"
                 ("dired" (mode . dired-mode))
                 ("org" (mode . org-mode))
                 ("IRC" (mode . erc-mode))
                 ("shell" (or (mode . term-mode)
                              (mode . shell-mode)
                              (mode . eshell-mode)))
                 ("mu4e" (or (mode . mu4e-compose-mode)
                             (name . "\*mu4e\*")))
                 ("Emacs" (or (name . "^\\*scratch\\*$")
                              (name . "^\\*Messages\\*$")
                              (name . "^\\*Packages\\*$")
                              (name . "^\\*Help\\*$"))))))))

(use-package ws-butler
  :ensure
  :diminish ws-butler-mode
  :config
  (add-hook 'prog-mode-hook 'ws-butler-mode))

(use-package editorconfig
  :ensure
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

(use-package rainbow-delimiters
  :ensure
  :commands rainbow-delimiters-mode
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package yasnippet
  :ensure
  :diminish yas-minor-mode
  :config
  (setq yas-snippet-dirs (list (concat core/etc-dir "snippets")))
  (yas-global-mode 1))

(use-package eldoc
  :diminish eldoc-mode
  :commands eldoc-mode
  :general
  (leader-def
    :states 'normal
    "cd" 'eldoc-doc-buffer)
  :config
  (add-hook 'prog-mode-hook 'eldoc-mode))

(use-package autoinsert
  :config
  (add-hook 'find-file-hook 'auto-insert)
  (setq auto-insert 'other
        auto-insert-query nil
        auto-insert-mode t
        auto-insert-alist '(("\.html\'" . "template.html")
                            ("^.*html.*$" . "template.html")
                            ("\.php\'" . "template.php")
                            ("^.*php.*$" . "template.php"))))

(use-package flycheck
  :ensure
  :commands flycheck-mode
  :general
  (leader-def
    :states 'normal
    "cx" 'flycheck-list-errors)
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package flycheck-pos-tip
  :ensure
  :after flycheck
  :config
  (setq flycheck-pos-tip-timeout 30)
  (flycheck-pos-tip-mode))

(when (executable-find "aspell")
  (use-package flyspell
    :config
    (evil-define-key '(normal visual) 'flyspell-mode-map (kbd "z=") 'flyspell-correct-at-point)
    (add-hook 'org-mode-hook 'flyspell-mode)
    (add-hook 'markdown-mode-hook 'flyspell-mode)
    (add-hook 'text-mode-hook 'flyspell-mode)))

(use-package comment-tags
  :ensure
  :init
  (setq comment-tags-keymap-prefix (kbd "C-c t"))
  :config
  (setq comment-tags-keyword-faces
        `(("TODO"  . ,(list :weight 'bold :foreground "#28ABE3"))
          ("FIXME" . ,(list :weight 'bold :foreground "#DB3340"))
          ("BUG"   . ,(list :weight 'bold :foreground "#DB3340"))
          ("HACK"  . ,(list :weight 'bold :foreground "#DB3340"))
          ("INFO"  . ,(list :weight 'bold :foreground "#F7EAC8"))
          ("DONE"  . ,(list :weight 'bold :foreground "#1FDA9A"))))
  (setq comment-tags-comment-start-only t
        comment-tags-require-colon t
        comment-tags-case-sensitive t
        comment-tags-show-faces t
        comment-tags-lighter nil)
  (add-hook 'prog-mode-hook 'comment-tags-mode))

(use-package company
  :ensure
  :diminish company-mode
  :bind (:map company-active-map
              ("<tab>" . company-complete-common-or-cycle)
              ("TAB" . company-complete-common-or-cycle)
              ("<backtab>" . company-select-previous))
  :hook (prog-mode . company-mode)
  :init
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 2
        company-tooltip-limit 20)

  (setq company-backends
        '((company-files
           company-cmake
           company-keywords
           company-capf
           company-yasnippet))))

(use-package org
  :config
  (setq org-directory "~/docs/org/"
        org-default-notes-file "~/docs/org/notes.org"
        org-agenda-files `(,org-directory)
        org-log-done t
        org-startup-indented t))

(use-package ox-reveal
  :ensure)

(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize)))

(use-package expand-region
  :ensure
  :bind
  (("C-=" . er/expand-region)))

(provide 'core-packages)
;;; core-packages.el ends here
