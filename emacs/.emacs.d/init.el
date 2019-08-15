;;; package --- Emacs config for prj2501.

;;; Commentary:
;;; Emacs config for prj2501 -- streamed live @ twitch.tv/prj2501.

;;; Code:

(add-to-list 'load-path "~/.emacs.d/init")

(load "init-packages")
(load "init-general")
(load "init-flycheck")
(load "init-golang")

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 '(package-selected-packages (quote (go-mode markdown-mode ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 )
