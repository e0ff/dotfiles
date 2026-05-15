;; -*- lexical-binding: t; -*-

(defconst IS-LINUX   (eq system-type 'gnu/linux))
(defconst IS-WINDOWS (memq system-type '(cygwin windows-nt ms-dos)))
(defconst IS-MAC (eq system-type 'darwin))

(defconst core/etc-dir (concat user-emacs-directory "etc/"))
(defconst core/cache-dir (concat user-emacs-directory "cache/"))

(defconst core/modules-dir (concat user-emacs-directory "modules/"))

(defconst core/local-file "local.el")
(defconst core/private-file "private.el")

(provide 'core-variables)
;;; core-variables.el ends here
