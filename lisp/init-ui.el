(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
;; 关闭启动画面
(setq inhibit-splash-screen 1)

;; 使屏幕最大化
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode)

(provide 'init-ui)
