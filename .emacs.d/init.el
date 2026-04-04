(when (version< emacs-version "30.1")
  (error (concat "This config requires Emacs 30.1+. Current version: " emacs-version)))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq find-file-visit-truename nil)

(setq straight-use-package-by-default t)
(straight-use-package 'use-package)
(straight-use-package 'diminish)
(straight-use-package 'project)

(add-to-list 'load-path (concat user-emacs-directory "core/"))
(add-to-list 'load-path (concat user-emacs-directory "themes/"))
(add-to-list 'load-path (concat user-emacs-directory "site-lisp/"))

(eval-when-compile
  (require 'use-package))
(require 'diminish)

(require 'bootstrap)

(core/init)

(provide 'init)
