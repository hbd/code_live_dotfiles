;;; package --- Emacs config for prj2501.

;;; Commentary:
;;; Emacs config for prj2501 -- streamed live @ twitch.tv/prj2501.

;;; Code:

(add-to-list 'load-path "~/.emacs.d/init")

(load "init-packages")
(load "init-general")
(load "init-multiple-cursors")
(load "init-flycheck")
(load "init-golang")

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (multiple-cursors go-mode markdown-mode ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
