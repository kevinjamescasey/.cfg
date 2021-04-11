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
(defun make-x-now-func (x-func x-name)
"Return an interactive function that will invoke X-FUNC
to launch a cli program in a buffer named with X-NAME as the prefix.
The suffix is determined by the current projectile project or
current directory."
(lambda (&optional arg)
  "Switch to a buffer running x-func.
Use projectile root directory if in a project,
or use current directory otherwise.
Reuse existing buffer and process if exists unless prefix ARG specified."
  (interactive "P")
  (let* ((project-dir (projectile-project-p))
         (launch-dir    (if project-dir
                          project-dir
                        (or default-directory
                            (file-name-directory buffer-file-name))))
         (buffer-name (projectile-generate-process-name x-name arg launch-dir)))
    (unless (get-buffer buffer-name)
      (print (concat "Launching " x-name " in dir " launch-dir))
      (projectile-with-default-dir launch-dir
          (set-buffer (funcall x-func buffer-name))))
    (switch-to-buffer buffer-name))))

(require 'shell)
(fset 'shell-now (make-x-now-func 'shell "shell"))

(require 'vterm)
(fset 'vterm-now (make-x-now-func 'vterm "vterm"))

(defun term-now (&optional arg)
  "Switch to a buffer running term.
Use projectile root directory if in a project,
or use current directory otherwise.
Reuse existing buffer and process if exists unless prex ARG specified."
  (interactive "P")
  (let* ((project-dir (projectile-project-p))
         (term-dir    (if project-dir
                          project-dir
                        (or default-directory
                            (file-name-directory buffer-file-name))))
         (buffer-name (projectile-generate-process-name "term" arg term-dir))
         (default-program (or explicit-shell-file-name
                              (getenv "ESHELL")
                              (getenv "SHELL")
                              "/bin/sh")))
    (unless (get-buffer buffer-name)
      (require 'term)
      (let ((program (if (equal arg '(16))
                         (read-from-minibuffer "Run program: " default-program)
                       default-program)))
        (print (concat "Launching term in " term-dir " with " program))
        (projectile-with-default-dir term-dir
          (set-buffer (term-ansi-make-term buffer-name program))
          (term-mode)
          (term-char-mode))))
    (switch-to-buffer buffer-name)))

(provide 'cli-now)
;;; term-now.el  ends here
