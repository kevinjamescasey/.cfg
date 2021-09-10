;;; my-cli.el --- Description -*- lexical-binding: t; -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(print "loading my-eshell.el")
(load-file "~/.emacs.d.mine/my-eshell.el")


(print "loading term-toggle-mode.el")
(load-file "~/.emacs.d.mine/term-toggle-mode.el")

(print "loading cli-now.el")
(load-file "~/.emacs.d.mine/cli-now.el")

(require 'shell)
(fset 'shell-now (make-x-now-func 'shell "shell"))

(when (string-equal system-type "darwin")
  (print "Using vterm on Mac")
  (require 'vterm)
  (fset 'vterm-now (make-x-now-func 'vterm "vterm"))

  (add-to-list 'vterm-eval-cmds '("update-pwd" (lambda (path) (setq default-directory path))))

  (add-hook 'vterm-mode-hook
            '(lambda ()
               (define-key vterm-mode-map (kbd "<C-i>") 'vterm-copy-mode)))

    )

(if (string-equal system-type "darwin")
    (global-set-key (kbd "C-c !") 'vterm-now)
  (global-set-key (kbd "C-c !") 'term-now))


(provide 'my-cli)
;;; my-cli.el ends here
