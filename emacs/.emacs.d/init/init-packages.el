;;; Initialize packages.
;; custom-set-variables was added by Package.el.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Refresh package management.
(package-initialize)

;; List of packages we want to install.
(defvar package-list)
(setq package-list
      '(
	;; Major modes.
        markdown-mode
	go-mode

	;; Golang.
        go-guru
        go-rename
	flycheck-golangci-lint

	;; Utilities.
	ag ;; Simple and quick searching.
	flycheck
	))

;; Install the missing packages.
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 '(package-selected-packages (quote (go-mode markdown-mode ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 )

;;; End of package initialization.
