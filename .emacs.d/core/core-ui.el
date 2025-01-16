(add-to-list 'default-frame-alist '(fullscreen . maximized))

(cond
 ((find-font (font-spec :name "Jetbrains Mono"))
  (add-to-list 'default-frame-alist '(font . "Jetbrains Mono-14")))
 ((find-font (font-spec :name "Monaco"))
  (add-to-list 'default-frame-alist '(font . "Monaco-14")))
 ((find-font (font-spec :name "Consolas"))
  (add-to-list 'default-frame-alist '(font . "Consolas-14"))))

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   (setq doom-themes-enable-bold t
;;         doom-themes-enable-italic t)
;;   (load-theme 'doom-Iosvkem t)
;;   (doom-themes-org-config))

(require 'undistinguished-theme)
(require 'undistinguished-light-theme)
(load-theme 'undistinguished t)

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-modal-icon nil)
  (setq doom-modeline-major-mode-icon nil)
  (doom-modeline-mode 1))

(use-package nyan-mode
  :ensure
  :config
  (nyan-mode 1))

(setq display-buffer-alist
      '(("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|[Hh]elp\\|Messages\\|Gofmt Errors\\)\\*"
         (display-buffer-in-side-window)
         (window-height . 0.25)
         (side . bottom)
         (slot . 0))
        ("^\\*terminal\\*$"
         (display-buffer-in-side-window)
         (window-height . 0.30)
         (side . bottom)
         (slot . 0))
        ("^\\*Python\\*$"
         (display-buffer-in-side-window)
         (window-height . 0.30)
         (side . bottom)
         (slot . 0))
        ("^\\*Flycheck errors\\*$"
         (display-buffer-in-side-window)
         (window-height . 0.30)
         (side . bottom)
         (slot . 0))))

(provide 'core-ui)
