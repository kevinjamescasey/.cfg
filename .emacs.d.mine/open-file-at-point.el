;;; open-file-at-point.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 John Doe
;;
;; Author: John Doe <https://github.com/kcase>
;; Maintainer: John Doe <john@doe.com>
;; Created: April 28, 2021
;; Modified: April 28, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/kcase/open-file-at-point
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:


(defun open-files-from-dired (&optional @fname)
  "Open the current file or dired marked files in external app.
When called in emacs lisp, if @fname is given, open that.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2019-11-04 2021-02-16"
  (interactive)
  (let* (
         ($file-list
          (if @fname
              (progn (list @fname))
            (if (string-equal major-mode "dired-mode")
                (dired-get-marked-files)
              (list (buffer-file-name)))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (shell-command (concat "PowerShell -Command \"Invoke-Item -LiteralPath\" " "'" (shell-quote-argument (expand-file-name $fpath )) "'")))
         $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))




(defun open-it ()
  (interactive)
  (let ((file-path (thing-at-point 'filename)))
    (print (concat "file-path is " file-path))
    (cond
     ((string-equal system-type "windows-nt")
      (shell-command (concat "PowerShell -Command \"Invoke-Item -LiteralPath\" " "'" (shell-quote-argument (expand-file-name file-path)) "'")))
     ((string-equal system-type "darwin")
      (shell-command
       (concat "open " (shell-quote-argument (expand-file-name file-path)))))
     ((string-equal system-type "gnu/linux")
      (let ((process-connection-type nil))
        (start-process "" nil "xdg-open" file-path))))))

(require 'dash) ;; provides -first
(require 'dired) ;; provides dired-current-directory

(defun get-path-dwim ()
  "Find a path indicated by point or buffer focus."
  (-first 'identity (list (and (string-equal major-mode "dired-mode")
                               (dired-get-filename nil t)) ; pass no first arg to get default behavior; pass second arg to avoid errors
                          (and (string-equal major-mode "dired-mode")
                               (dired-current-directory))
                          (thing-at-point 'filename)
                          (buffer-file-name))))

(defun open-in-vscode ()
  "Open the thing identified by get-path-dwim in VSCode."
  (interactive)
  (let ((file-path (get-path-dwim)))
    (shell-command
     (concat "code -n " (shell-quote-argument (expand-file-name file-path))))))

(defun show-it ()
  "Show what is returned from get-path-dwim."
  (interactive)
  (message "%s" (get-path-dwim)))

(provide 'open-file-at-point)
;;; open-file-at-point.el ends here
