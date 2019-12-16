(setq default-config-start-directory "~/.emacs.d/")
(setq no-config-start-directory "~/does-not-exist/")
(setq lsp-java-start-directory "~/.emacs.d.java-lsp/")
(setq spacemacs-start-directory "~/.emacs.d.spacemacs/")

(setq init-file (concat spacemacs-start-directory "init.el"))

(setq user-init-file init-file)
(setq user-emacs-directory (file-name-directory user-init-file))
(load-file init-file)
(load-file "~/.emacs.d.mine/my-mode.el")
