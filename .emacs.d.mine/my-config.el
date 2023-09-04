;;; package --- Summary
;;; Commentary:
;; my configuration
;;; Code:

(print (concat "System type:"  (symbol-name system-type)))


;stop frame from being suspended
(global-set-key (kbd "C-x C-z") 'repeat)
(global-set-key (kbd "C-z") 'repeat)

;stop macro thing from accidentally popping up all the time when trying to kill a buffer
(global-set-key (kbd "C-x  C-k") 'kill-buffer)

 ;dash.el is required for -first
 ;-first is used to choose the first command in the list that exists
 ;this allows my-config to still work ok even if a particular package is not installed
 ;this is helpful when switching between spacemacs, doom, vanilla, etc.
(require 'dash)

;;replacements for switch-to-buffer (C-x b)
;ido-switch-buffer
;helm-buffers-list
;counsel-switch-buffer
;ivy/switch-workspace-buffer never used
;ivy/switch-buffer
(global-set-key (kbd "C-x b") (-first 'fboundp '(helm-buffers-list counsel-switch-buffer)))
(setq helm-buffer-max-length nil) ;buffer name column width as wide as the longest name instead of the default 20 width
;mode-line-other buffer can be used to switch to most recent buffer without a prompt for selection

;;replacements for find-file (C-x f)
;spacemacs/helm-find-files
;helm-find-files
;counsel-find-file

(global-set-key (kbd "C-x C-f") (-first 'fboundp '(counsel-find-file helm-find-files)))

;;replacements for execute-extended-command (M-x)
;helm-M-x
;counsel-M-x

;; Use C-SPC in place of C-x
(global-set-key (kbd "C-SPC") (copy-keymap ctl-x-map))

;;searching
;dead-grep
;helm-occur find in current buffer
;helm-rg grep current directory
;counsel-rg grep current directory
;consel-locate
;swiper
;swiper-helm

(add-hook 'helm-minibuffer-set-up-hook (progn (setq helm-echo-input-in-header-line t)))

;make redo work in Doom
(if (fboundp 'after!)
    (after! undo-fu
            (map! :map undo-fu-mode-map "C-?" #'undo-fu-only-redo)))

;make buffer switching commands work consistently
;https://emacs.stackexchange.com/questions/64001/why-do-many-buffer-switching-commands-in-doom-emacs-skip-over-buffers-that-aren
(setq doom-unreal-buffer-functions '(minibufferp))

(global-set-key (kbd "M-n") 'scroll-up-command)
(global-set-key (kbd "M-p") 'scroll-down-command)

(define-key input-decode-map [?\C-m] [C-m]) ;distinguish C-m from RET
(define-key input-decode-map [?\C-i] [C-i]) ;distinguish C-i from TAB


(print "loading my-mode.el")
(load-file "~/.emacs.d.mine/my-mode.el")

(print "loading my-cli.el")
(load-file "~/.emacs.d.mine/my-cli.el")

(setq mac-right-option-modifier 'left)

(print "Configuring less crucial things")

;not really using this. should probably remove it
;I thought it would be useful to learn more ibuffer features, but YAGNI
(load-file "~/.emacs.d.mine/hydra-ibuffer.el")
;(define-key ibuffer-mode-map "?" 'hydra-ibuffer-main/body)

(print "loading my-ibuffer.el")
(load-file "~/.emacs.d.mine/my-ibuffer.el")
;(define-key ibuffer-mode-map "o" 'ibuffer-visit-buffer-other-window-noselect)
(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (define-key ibuffer-mode-map "o" 'ibuffer-visit-buffer-other-window-noselect)
             (define-key ibuffer-mode-map "?" 'hydra-ibuffer-main/body)))

(print "loading open-file-at-point.el")
(load-file "~/.emacs.d.mine/open-file-at-point.el")



(if (boundp `dired-mode-map)
    (print "dired-mode-map is bound")
  (print "dired-mode-map is NOT bound"))
(add-hook 'dired-mode-hook
	  '(lambda ()
             (define-key dired-mode-map "o" 'dired-display-file)))



;; use letters instead of numbers for ace-window
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))


(setf epa-pinentry-mode 'loopback); make gpg prompt for passphrase

(defun display-prefix (arg)
  "Display the value of the raw prefix ARG."
  (interactive "P")
  (message "%s" arg))

(defun shrug ()
  (interactive)
  (insert "¯\\_(ツ)_/¯"))


(defun search-all-buffers (regexp)
  "Search for REGEXP in all buffers."
  (interactive "sRegex: ")
  ; third  argument is the same as a prefix arg interactively
  (multi-occur-in-matching-buffers "." regexp t))

;https://stackoverflow.com/a/9411825
(defun copy-buffer-file-name-as-kill (choice)
  "Copies all or part of the name of the buffer's file path to the kill-ring."
  ;(interactive "cCopy (b) buffer name, (m) buffer major mode, (f) full buffer-file path, (d) buffer-file directory, (n) buffer-file basename")
  (interactive "cCopy (f) file name, (d) directory, (a) absolute path, (p) relative to project, (h) relative to home")
  (let ((new-kill-string)
        (name (if (eq major-mode 'dired-mode)
                  (dired-get-filename)
                (or (buffer-file-name) ""))))
    (cond ((eq choice ?a)
           (setq new-kill-string name))
          ((eq choice ?f)
           (setq new-kill-string (file-name-nondirectory name)))
          ((eq choice ?d)
           (setq new-kill-string (file-name-directory name)))
          ((eq choice ?p)
           (setq new-kill-string (file-relative-name name (projectile-project-root))))
          ((eq choice ?h)
           (setq new-kill-string (concat "~/" (file-relative-name name "~"))))
          ;; ((eq choice ?b)
          ;;  (setq new-kill-string (buffer-name)))
          ;; ((eq choice ?m)
          ;;  (setq new-kill-string (format "%s" major-mode)))
          (t (message "Quit")))
    (when new-kill-string
      (message "%s copied" new-kill-string)
      (kill-new new-kill-string))))

(setq-default typescript-indent-level 2)

(add-hook 'vue-mode-hook #'lsp!)


;tried to make Emacs start in full screen
;but doesn't quite line up correctly on Windows in XServer
;(add-to-list 'initial-frame-alist '(fullscreen . fullboth))

; consider trying this auto save
 ;; (defun save-all ()
 ;;    (interactive)
 ;;    (save-some-buffers t))

 ;;  (add-hook 'focus-out-hook 'save-all)


; white borders help between vterm panes that don't have a mode line
; this is not working automatically but it works if you eval it
; maybe it needs to run at a different time in a hook or something
(set-face-foreground 'vertical-border "white")


;;https://github.com/jscheid/prettier.el#configuration
;;format on save where possible
(add-hook 'after-init-hook #'global-prettier-mode)

;;causing a popup on save that says it can't find prettier
;; (use-package prettier
;;   :hook ((typescript-mode . prettier-mode)
;;          ;(js-mode . prettier-mode)
;;          (json-mode . prettier-mode)
;;          (yaml-mode . prettier-mode)
;;          (ruby-mode . prettier-mode)))

(use-package idle-highlight-mode
  :config (setq idle-highlight-idle-time 0.2 idle-highlight-visible-buffers t)

  :hook ((prog-mode text-mode) . idle-highlight-mode))

(provide 'my-config)
;;; my-config.el ends here
