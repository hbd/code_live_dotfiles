;; Theme.
(load-theme 'misterioso)

;; Store temp file outside current dir.
(setq temporary-file-directory "~/.emacs.d/tmp/")
(setq backup-directory-alist         `((".*" . , temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" , temporary-file-directory t)))
(setq create-lockfiles nil)

;; Highlight matching ( [ { } ] ).
(require 'paren)
(show-paren-mode t)

;; ido-mode for file browsing.
(when (require 'ido nil t) (ido-mode t)) ; (Much) Better file/buffer browsing.

;; No bell.
(setq ring-bell-function 'ignore)
(setq bell-volume 0)

;;; Enable mouse support. ;;;
(xterm-mouse-mode t)

;; Wheel support.
(global-set-key [mouse-4] (lambda ()
                            (interactive)
                            (scroll-down 5)))
(global-set-key [mouse-5] (lambda ()
                            (interactive)
                            (scroll-up 5)))
