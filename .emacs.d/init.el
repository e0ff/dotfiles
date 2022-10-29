(when (version< emacs-version "26.1")
  (error (concat "This config requires Emacs 26.1+. Current version: " emacs-version)))

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(when (version< emacs-version "27")
  (package-initialize))

(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t)
(straight-use-package 'use-package)
(straight-use-package 'diminish)

(add-to-list 'load-path (concat user-emacs-directory "core/"))
(add-to-list 'load-path (concat user-emacs-directory "themes/"))
(add-to-list 'load-path (concat user-emacs-directory "site-lisp/"))

(eval-when-compile
  (require 'use-package))
(require 'diminish)

(require 'bootstrap)

(core/init)

(provide 'init)
