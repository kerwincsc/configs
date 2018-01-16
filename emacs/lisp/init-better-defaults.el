(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

;; 禁止生成备份
(setq make-backup-files nil)
(setq auto-save-default nil)
;; 文件被选中时, 按<C-d>直接删除
(delete-selection-mode t)

;; 缩写补全
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; ("缩写" "全称")
					    ("8kc" "kerwin")
					    ("8ms" "Macrosoft")
					    ))




(recentf-mode 1)
(setq recentf-max-menu-items 15)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
;; 禁止产生过多的由Dired-mode打开的buffer

(put 'dired-find-alternate-file 'disabled nil)
;;(require 'dired)

(require 'dired-x)
(setq dired-dwin-target t)

(column-number-mode t)

;; ========== defined by myself ==========


(provide 'init-better-defaults)
