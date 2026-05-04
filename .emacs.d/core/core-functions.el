;; -*- lexical-binding: t; -*-

(defun core/load-directory (dir)
  "`load' all elisp libraries in directory DIR and its subdirectories."
  (interactive "D")

  (unless (member dir load-path)
    (add-to-list 'load-path dir))

  (dolist (file (directory-files dir))
    (unless (string-prefix-p "." file)
      (let ((full-path (concat (file-name-as-directory dir) file)))
        (if (file-directory-p full-path)
            (progn
              (unless (member full-path load-path)
                (add-to-list 'load-path full-path))
              (core/load-directory full-path))
          (let ((library (file-name-sans-extension file)))
            (message "loading: %s" full-path)
            (load library nil t)))))))

(provide 'core-functions)
