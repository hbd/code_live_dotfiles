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
	go-mode
        markdown-mode

	;; Minor modes.
	lsp-mode
	multiple-cursors

	;; Golang.
	flycheck-golangci-lint
        go-guru
        go-rename

	;; Utilities.
	ag ;; Simple and quick searching.
	company
	company-lsp
	flycheck
	lsp-ui
	))

;; Install the missing packages.
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-packages)

;;; End of package initialization.
