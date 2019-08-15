;; Flycheck.

;;; Flycheck config. ;;;
(add-hook 'after-init-hook 'global-flycheck-mode)            ;; Enable flycheck everywhere.
(global-set-key (kbd "C-c <up>")   'flycheck-next-error)     ;; Ctrl-up   to go to next error.
(global-set-key (kbd "C-c <down>") 'flycheck-previous-error) ;; Ctrl-down to go to previous error.
(global-set-key (kbd "C-c l")      'flycheck-list-errors)    ;; Ctrl-l    to display error list.

;;; Golang.
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-golangci-lint-setup))
