;; -*- lexical-binding: t; -*-

(defadvice term-handle-exit
    (after term-kill-buffer-on-exit activate)
  (delete-window (selected-window)))
