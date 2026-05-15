;;; langs/python/config.el -*- lexical-binding: t; -*-

(defun python-f5 ()
  "Sends the buffer to a python shell."
  (interactive)
  (python-shell-send-buffer)
  (python-shell-switch-to-shell))

(use-package python
  :general
  (local-leader-def
    :states 'normal
    :keymaps 'python-mode-map
    "r" 'run-python)
  :bind
  (:map python-mode-map
        ("<f5>" . python-f5)))

(use-package poetry
  :config
  (setq poetry-tracking-strategy 'switch-buffer)
  (add-hook 'python-mode-hook 'poetry-tracking-mode))

(use-package virtualenvwrapper
  :general
  (local-leader-def
    :states 'normal
    :keymaps 'python-mode-map
	"v" '(:ignore t :which-key "virtualenv")
    "va" 'venv-workon
    "vd" 'venv-deactivate)
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

(use-package pip-requirements)
