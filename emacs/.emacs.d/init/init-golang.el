;; LSP.
;;; lsp-mode using gopls.
(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp)
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(require 'company-lsp)
(push 'company-lsp company-backends)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'go-mode-hook 'flycheck-mode)

;; Go Guru configuration.
(defun coder/go-guru-set-current-package-as-main ()
  "GoGuru requires the scope to be set to a go package which
   contains a main, this function will make the current package the
   active go guru scope, assuming it contains a main"
  (interactive)
  (let* ((filename (buffer-file-name))
         (gopath-src-path (concat (file-name-as-directory (go-guess-gopath)) "src"))
         (relative-package-path (directory-file-name (file-name-directory (file-relative-name filename gopath-src-path)))))
    (setq go-guru-scope relative-package-path)))

(defun go-save-and-compile-program()
  "Save any unsaved buffers and compile."
  (interactive)
  (save-some-buffers t)
  (compile "sh -c 'go install && go build -o /tmp/a.out && /tmp/a.out'")
  )

(defun go-save-and-test-program()
  "Save any unsaved buffers and compile."
  (interactive)
  (save-some-buffers t)
  (compile "go test -v -cover -coverprofile=/tmp/coverprofile -covermode=count")
  )
(setq compilation-scroll-output t)

(add-hook 'go-mode-hook ;; Scope config to go-mode.
          (lambda()
            ;;; Formatting.
            (setq gofmt-command "goimports")                ;; Use goimports instead of gofmt.
            (add-hook 'before-save-hook 'gofmt-before-save) ;; Trigger goimports when saving.

            ;;; Useful key bindings.
            (global-set-key (kbd "M-*")     'pop-tag-mark)     ;; Pop mark after jumping to definition.
            (global-set-key (kbd "C-c C-i") 'go-goto-imports)  ;; Jump to import list.
            (global-set-key (kbd "C-c C-e") 'go-rename)        ;; Call go-rename at point.
            (global-set-key (kbd "C-c d")   'godoc-at-point)   ;; Open godoc from point in new pane.
	    (global-set-key (kbd "C-c C-c") 'comment-region)   ;; Comment region.
	    (global-set-key (kbd "C-c C-u") 'uncomment-region) ;; Uncomment region.
	    (local-unset-key (kbd "C-c C-a")) ;; Unset manual import shortcut.

	    ;;; Compilation key bindings.
	    (global-set-key (kbd "C-c f") 'go-save-and-compile-program)
	    (global-set-key (kbd "C-c t") 'go-save-and-test-program)

	    ;; Call coverage binding.
	    (global-set-key (kbd "C-c c") '(lambda() (interactive) (go-coverage "/tmp/coverprofile")))

            ;; Snippets management.
	    (yas-global-mode 1)
	    (add-to-list 'yas-snippet-dirs "~/.emacs.files/yasnippet-go")

	    (go-eldoc-setup)             ;; Init eldoc.
	    (go-guru-hl-identifier-mode) ;; Enable symbol highlight.

	    ;; Make a lighter godoc-at-point using popup.
	    ;; TODO: Pass buffer content via stdin to make it work with edited buffer.
	    ;; TODO: Handle errors.
	    (global-set-key (kbd "C-c s")
			    (lambda ()
			      (interactive)
			      (setq rawdoc (shell-command-to-string
					    (concat "gogetdoc -json -pos "
						    buffer-file-name ":#"
						    (format "%s" (point)))))
			      (let* ((json-object-type 'hash-table)
				     (json-array-type 'list)
				     (json-key-type 'string)
				     (json (json-read-from-string rawdoc)))
				(popup-tip (concat "\n" (gethash "doc" json)))
				)))
            ))

;;
;; Custom funcs and key bindings.
;;
(global-set-key (kbd "C-c C-r") 'my-recompile)
(global-set-key (kbd "C-c C-k") 'kill-compilation)
(global-set-key (kbd "C-c C-l") 'linum-mode)

(defun end-of-line-compile()
  (setq curbuf (current-buffer))
  (pop-to-buffer "*compilation*")
  (end-of-buffer)
  (pop-to-buffer curbuf)
  )

;; Save all files then run M-x compile.
(defun my-recompile()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
	(end-of-line-compile)
        (recompile)
	(end-of-line-compile))

(defun save-and-compile-program()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
        (compile "bash -c 'go install && go build -o /tmp/a.out && /tmp/a.out'")
	(end-of-line-compile))

(defun save-and-test-program()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
        (compile "go test -v -cover -coverprofile=coverprofile -covermode=count")
	(end-of-line-compile))

(defun save-and-make-test-program()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
        (compile "make test SKIP_FMT=1 NOPULL=1 TEST_OPTS='-v .'")
	(end-of-line-compile))

(defun save-and-make-clean-program()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
        (compile "make clean")
	(end-of-line-compile))

(defun save-and-make-program()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
        (compile "make start NOPULL=1")
	(end-of-line-compile))
