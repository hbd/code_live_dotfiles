;;; Multiple cursor config. ;;;
(global-set-key (kbd "S-<mouse-1>") 'mc/add-cursor-on-click)         ;; Add new cursor with shift-click.
(global-set-key (kbd "M-n")         'mc/mark-next-like-this)         ;; Add new cursor with matching region.
(global-set-key (kbd "M-p")         'mc/mark-previous-like-this)     ;; Add new cursor with matching region.
(global-set-key (kbd "M-]")         'mc/mark-all-like-this)          ;; Add new cursor with matching region.
(global-set-key (kbd "C-c SPC")     'set-rectangular-region-anchor)  ;; Rectangular region with many cursors.
(global-set-key (kbd "M-SPC")       'set-rectangular-region-anchor)  ;; Rectangular region with many cursors.
