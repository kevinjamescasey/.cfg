;;; term-toggle-mode.el --- Description -*- lexical-binding: t; -*-
;;
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;  from https://emacs.stackexchange.com/questions/5585/how-to-copy-command-output-in-ansi-term-mode
;;
;;  Description
;;
;;; Code:



(provide 'term-toggle-mode)


(require 'term)

(defun my/term-toggle-mode ()
  "Toggle term between line mode and char mode."
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(define-key term-mode-map (kbd "<C-i>") 'my/term-toggle-mode)

(define-key term-raw-map (kbd "<C-i>") 'my/term-toggle-mode)



;;; term-toggle-mode.el ends here
