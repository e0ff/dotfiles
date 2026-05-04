;; -*- lexical-binding: t; -*-

(if (file-exists-p "~/bin")
    (add-to-list 'exec-path "~/bin" t))
(add-to-list 'exec-path "/usr/local/bin" t)

(if (file-exists-p "/bin/zsh")
    (setq-default shell-file-name "/bin/zsh"))

(provide 'linux)
