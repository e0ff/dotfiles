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

(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package poetry
  :config
  (setq poetry-tracking-strategy 'switch-buffer)
  (add-hook 'python-mode-hook 'poetry-tracking-mode))

(use-package virtualenvwrapper
  :general
  (local-leader-def
    :states 'normal
    :keymaps 'anaconda-mode-map
	"v" '(:ignore t :which-key "virtualenv")
    "va" 'venv-workon
    "vd" 'venv-deactivate)
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

(use-package blacken
  :init
  (setq blacken-only-if-project-is-blackened t)
  :config
  (add-hook 'python-mode-hook 'blacken-mode))

(use-package py-isort
  :general
  (local-leader-def
    :states 'normal
    :keymaps 'python-mode-map
    "i" '(:ignore t :which-key "imports")
    "ib" 'py-isort-buffer
    "ir" 'py-isort-region)
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package pip-requirements)
