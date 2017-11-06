(require 'cl)

(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

;; add whatever packages you want here
(defvar kerwin/packages '(
			  company
			  monokai-theme
			  hungry-delete
			  swiper
			  counsel
			  smartparens
			  js2-mode
			  exec-path-from-shell
			  magit
			  popwin
			  reveal-in-osx-finder
			  ) "Default packages")

(setq package-selected-packages kerwin/packages)

(defun kerwin/packages-installed-p ()
  (loop for pkg in kerwin/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (kerwin/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg kerwin/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-company-mode 1)

(load-theme 'monokai t)

(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
