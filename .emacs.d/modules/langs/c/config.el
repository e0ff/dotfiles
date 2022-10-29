;;; langs/c/config.el -*- lexical-binding: t; -*-

(c-add-style "my-c-style" '((c-continued-statement-offset 4)
                            (c-tab-always-indent t)
                            (c-toggle-hungry-state t)
                            (c-offsets-alist
                             (inline-open . +)
                             (block-open . +)
                             (brace-list-open . +)
                             (case-label . +)
                             (access-label . /))))

(setq c-default-style
      (quote
       ((c-mode . "my-c-style")
        (c++-mode . "my-c-style")
        (java-mode . "java")
        (awk-mode . "awk"))))

(use-package clang-format+
  :ensure
  :config
  (add-hook 'c-mode-common-hook 'clang-format+-mode))

(defun my-makefile-hook ()
  "Hook for `makefile-mode'."
  (setq-local indent-tabs-mode t))

(add-hook 'makefile-mode-hook 'my-makefile-hook)

(use-package cmake-mode
  :ensure
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode)))

(use-package meson-mode
  :ensure)
