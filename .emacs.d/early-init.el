;;; early-init.el --- early init -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.5)

(setq package-enable-at-startup nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 100 100 8)
                  gc-cons-percentage 0.1)))

(provide 'early-init)
