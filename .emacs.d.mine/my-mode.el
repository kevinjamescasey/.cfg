;; Main use is to have my key bindings have the highest priority
;; https://github.com/kaushalmodi/.emacs.d/blob/master/elisp/modi-mode.el

(defvar my-mode-map (make-sparse-keymap)
  "Keymap for `my-mode'.")

;;;###autoload
(define-minor-mode my-mode
  "A minor mode so that my key settings override annoying major modes."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-my-mode 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value t
  :lighter " my-mode"
  :keymap my-mode-map)

;;;###autoload
(define-globalized-minor-mode global-my-mode my-mode my-mode)

;; https://github.com/jwiegley/use-package/blob/master/bind-key.el
;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists `((my-mode . ,my-mode-map)))

;; Turn off the minor mode in the minibuffer
(defun turn-off-my-mode ()
  "Turn off my-mode."
  (my-mode -1))
(add-hook 'minibuffer-setup-hook #'turn-off-my-mode)

(provide 'my-mode)

;; Minor mode tutorial: http://nullprogram.com/blog/2013/02/06/

(define-key my-mode-map (kbd "<C-return>") 'helm-M-x)
(define-key my-mode-map (kbd "C-;") 'er/expand-region)
(define-key my-mode-map (kbd "C-'") 'kill-ring-save)
(define-key my-mode-map (kbd "<C-m>") 'set-mark-command)
(define-key input-decode-map [?\C-m] [C-m])
(define-key my-mode-map (kbd "C-o") 'ace-window)
(define-key my-mode-map (kbd "M-o") 'open-line)
(define-key my-mode-map (kbd "C-SPC C-b") 'ibuffer-list-buffers)
(define-key my-mode-map [remap move-beginning-of-line] #'crux-move-beginning-of-line)

(define-key my-mode-map (kbd "C-SPC g") 'magit-status)
(define-key my-mode-map (kbd "M-z") 'zap-up-to-char)

(define-key my-mode-map (kbd "C-,") 'beginning-of-buffer)
(define-key my-mode-map (kbd "C-.") 'end-of-buffer)

(define-key my-mode-map (kbd "M-,") 'beginning-of-buffer)
(define-key my-mode-map (kbd "M-.") 'end-of-buffer)

(define-key my-mode-map (kbd "M-n") 'scroll-up-command)
(define-key my-mode-map (kbd "M-p") 'scroll-down-command)

(define-key (current-global-map) "\C-c!" 'shell-here)

(define-key my-mode-map (kbd "C-SPC f") 'projectile-find-file)
(delete-selection-mode 1)

