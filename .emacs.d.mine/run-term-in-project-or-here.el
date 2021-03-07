;;; run-term-in-project-or-here.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 John Doe
;;
;; Author: John Doe <https://github.com/kevin>
;; Maintainer: John Doe <john@doe.com>
;; Created: March 07, 2021
;; Modified: March 07, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/kevin/run-term-in-project-or-here
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defun run-term-in-project-or-here (&optional arg)
  "Switch to a buffer running term.
Use projectile root directory if in a project,
or use current directory otherwise.
Reuse existing buffer and process if exists unless prex ARG specified."
  (interactive "P")
  (let* ((project-dir (projectile-project-p))
         (_ (print (concat "project-dir:" project-dir)))
         (term-dir    (if project-dir
                          project-dir
                        (or default-directory
                            (file-name-directory buffer-file-name))))
         (_ (print (concat "term-dir:" term-dir)))
         (buffer-name (projectile-generate-process-name "term" arg term-dir))
         (_ (print (concat "buffer-name:" term-dir)))
         (default-program (or explicit-shell-file-name
                              (getenv "ESHELL")
                              (getenv "SHELL")
                              "/bin/sh")))
    (unless (get-buffer buffer-name)
      (require 'term)
      (let ((program (if (equal arg '(16))
                         (read-from-minibuffer "Run program: " default-program)
                       default-program)))
        (projectile-with-default-dir term-dir
          (set-buffer (term-ansi-make-term buffer-name program))
          (term-mode)
          (term-char-mode))))
    (switch-to-buffer buffer-name)))

(provide 'run-term-in-project-or-here)
;;; run-term-in-project-or-here.el ends here
