;;; package --- Summary
;;; Commentary:
;; my configuration
;;; Code:


(when (string-equal system-type "windows-nt")
  (print "Running on Windows")
    )

;; Use C-SPC in place of C-x
(global-set-key (kbd "C-SPC") (copy-keymap ctl-x-map))
(global-set-key (kbd "C-SPC b") 'counsel-switch-buffer)
(global-set-key (kbd "M-n") 'scroll-up-command)
(global-set-key (kbd "M-p") 'scroll-down-command)
(define-key input-decode-map [?\C-m] [C-m]) ;distinguish C-m from RET
(define-key input-decode-map [?\C-i] [C-i]) ;distinguish C-i from TAB

(if (boundp `dired-mode-map)
    (print "dired-mode-map is bound")
  (print "dired-mode-map is NOT bound"))
(add-hook 'dired-mode-hook
	  '(lambda ()
             (define-key dired-mode-map "o" 'dired-display-file)))


;; use letters instead of numbers for ace-window
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))


(defun display-prefix (arg)
  "Display the value of the raw prefix ARG."
  (interactive "P")
  (message "%s" arg))


(defun search-all-buffers (regexp)
  "Search for REGEXP in all buffers."
  (interactive "sRegex: ")
  ; third  argument is the same as a prefix arg interactively
  (multi-occur-in-matching-buffers "." regexp t))


;(add-to-list 'initial-frame-alist '(fullscreen . fullboth)) ;doesn't quite line up correctly on Windows in XServer


(load-file "~/.emacs.d.mine/term-toggle-mode.el")
(load-file "~/.emacs.d.mine/run-term-in-project-or-here.el")
(global-set-key (kbd "C-c !") 'run-term-in-project-or-here)

(load-file "~/.emacs.d.mine/hydra-ibuffer.el")
(define-key ibuffer-mode-map "?" 'hydra-ibuffer-main/body)

(load-file "~/.emacs.d.mine/my-ibuffer.el")
(define-key ibuffer-mode-map "o" 'ibuffer-visit-buffer-other-window-noselect)


(load-file "~/.emacs.d.mine/my-mode.el")

(provide 'my-config)
;;; my-config.el ends here
