;;; tools/docker/config.el -*- lexical-binding: t; -*-

(use-package docker
  :general
  (general-define-key
    :states '(normal emacs)
    "C-c d" 'docker))

(use-package dockerfile-mode)
