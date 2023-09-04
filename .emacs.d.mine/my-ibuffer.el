;;; my-ibuffer.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 John Doe
;;
;; Author: John Doe <https://github.com/kevin>
;; Maintainer: John Doe <john@doe.com>
;; Created: March 07, 2021
;; Modified: March 07, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/kevin/my-ibuffer
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(setq ibuffer-saved-filter-groups
      (quote
       (("default"
         ("dired"
          (mode . dired-mode))
         ("dired"
          (used-mode . dired-mode))
         ("shells"
          (or
           (used-mode . eshell-mode)
           (used-mode . term-mode)
           (used-mode . shell-mode)
           (used-mode . vterm-mode)))
         ("repls"
          (mode . comint-mode))
         ("files"
          (and (filename . ".")
               (not (used-mode . helpful-mode))
               (not (used-mode . emacs-news-view-mode))))
         ("special"
          (or (starred-name)
              (used-mode . emacs-news-view-mode)))))))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
             (ibuffer-auto-mode 1)
	     (ibuffer-switch-to-saved-filter-groups "default")))

(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)

(provide 'my-ibuffer)
;;; my-ibuffer.el ends here
