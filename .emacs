;; You can choose one of these isolated configs at a time
(setq default-config-start-directory "~/.emacs.d/")
(setq no-config-start-directory "~/does-not-exist/")
(setq lsp-java-start-directory "~/.emacs.d.java-lsp/")
(setq spacemacs-start-directory "~/.emacs.d.spacemacs/")
(setq doom-start-directory "~/.emacs.d.doom/")

;; Specifcy your chosen config
(setq init-file (concat doom-start-directory "init.el"))

;; Load the chosen config
(setq user-init-file init-file)
(setq user-emacs-directory (file-name-directory user-init-file))
(load-file init-file)

;; Load your configs that are outside the user-eamcs-directory
(load-file "~/.emacs.d.mine/my-config.el")
