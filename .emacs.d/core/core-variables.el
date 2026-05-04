;; -*- lexical-binding: t; -*-

(defconst IS-LINUX   (eq system-type 'gnu/linux))
(defconst IS-WINDOWS (memq system-type '(cygwin windows-nt ms-dos)))
(defconst IS-MAC (eq system-type 'darwin))

(defconst core/etc-dir (concat user-emacs-directory "etc/"))
(defconst core/cache-dir (concat core/etc-dir "cache/"))
(defconst core/private-dir (concat core/etc-dir "private/"))

(defconst core/modules-dir (concat user-emacs-directory "modules/"))

(defconst core/local-file (concat core/private-dir "local.el"))
(defconst core/private-file (concat core/private-dir "private.el"))

(provide 'core-variables)
;;; core-variables.el ends here
