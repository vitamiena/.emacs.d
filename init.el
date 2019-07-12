(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defvar my/favorite-packages
  '(init-loader
    package
    smartparens
    helm
    auto-complete
    fuzzy
    flycheck
    flycheck-pos-tip
    web-mode
    js2-mode
    coffee-mode
    emmet-mode
    scss-mode
    go-mode
    ruby-electric
    ruby-block
    slim-mode
    projectile
    projectile-rails
    recentf-ext
    grizzl
    rust-mode
    cargo
    toml-mode
    flycheck-rust
    yaml-mode
    scala-mode))

(defun  set-pac ()
  "my package install command"
  (interactive)
  (package-refresh-contents)
  (dolist (package my/favorite-packages)
    (when (not (package-installed-p package))
    (package-install package))))
;;--------------------------------------------------------------------------------
;; init-loader
;;--------------------------------------------------------------------------------
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
;;--------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------
;; ロードパス
;;--------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;;--------------------------------------------------------------------------------
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages (quote (init-loader))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-list-file-name nil t)
 '(auto-save-list-file-prefix nil)
 '(delete-auto-save-files t)
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (groovy-mode terraform-mode scala-mode yaml-mode flycheck-rust toml-mode cargo rust-mode grizzl recentf-ext projectile-rails projectile slim-mode ruby-block ruby-electric go-mode scss-mode emmet-mode coffee-mode js2-mode web-mode flycheck-pos-tip flycheck fuzzy auto-complete helm smartparens init-loader)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "white" :background "black"))))
 '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))
 '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box nil))))
 '(web-mode-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-face ((t (:background "grey18"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))))
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-javascript-face ((t (:background "grey36"))))
 '(web-mode-server-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-server-face ((t (:background "grey")))))
