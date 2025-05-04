(defvar core/leader-key "SPC")
(defvar core/local-leader-key "SPC m")

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (setq which-key-allow-evil-operators t)
  (which-key-setup-side-window-bottom)

  (which-key-add-key-based-replacements core/leader-key "<leader>")
  (which-key-add-key-based-replacements core/local-leader-key "<localleader>")

  (which-key-mode))

(use-package general
  :ensure
  :config
  (general-override-mode 1)

  (general-create-definer leader-def
    :prefix core/leader-key
    :non-normal-prefix "C-SPC")
  (general-create-definer local-leader-def
    :prefix core/local-leader-key
    :non-prefix "C-SPC m")

  (leader-def
   :states 'normal
   "" nil

   "SPC" 'execute-extended-command

   "b" '(:ignore t :which-key "buffers")
   "bb" 'switch-to-buffer
   "bB" 'ibuffer-other-window
   "bk" 'kill-current-buffer
   "bK" 'kill-buffer
   "br" 'revert-buffer

   "c" '(:ignore t :which-key "code")

   "h" '(:ignore t :which-key "help")
   "hv" 'describe-variable
   "hf" 'describe-function
   "hk" 'describe-bindings

   "f" '(:ignore t :which-key "files")
   "ff" 'find-file
   "fr" 'recentf
   "fi" '(lambda () (interactive) (find-file "~/.emacs.d/init.el"))
   "fp" '(lambda () (interactive) (find-file core/private-file))
   "fl" '(lambda () (interactive) (find-file core/local-file))
   "fc" '(lambda () (interactive) (find-file custom-file))

   "o" '(:ignore t :which-key "open")
   "ot" 'term
   "oa" 'org-agenda
   "oc" 'org-capture
   "om" 'mu4e

   "p" '(:ignore :which-key "projects")
   "pp" 'project-find-file
   "pd" 'project-dired
   "pk" 'project-kill-buffers
   "ps" 'project-switch-project

   "t" '(:ignore t :which-key "toggle")
   "tw" 'whitespace-mode
   "tf" 'display-fill-column-indicator-mode

   ;; window management
   "w" '(:ignore t :which-key "windows")

   ;; window creating/deleting
   "w0" 'delete-window
   "w1" 'delete-other-windows
   "wc" 'delete-window
   "wu" 'winner-undo
   "wr" 'winner-redo
   "ws" 'evil-window-split
   "wv" 'evil-window-vsplit

   ;; window moving
   "ww" 'other-window
   "wh" 'windmove-left
   "wj" 'windmove-down
   "wk" 'windmove-up
   "wl" 'windmove-right

   "w=" 'balance-windows

   "/" 'counsel-rg)

  (general-define-key
   :states '(insert emacs)
   "C-a" 'beginning-of-line
   "C-e" 'end-of-line))

(provide 'core-keybindings)
