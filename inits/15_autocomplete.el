;;------------------------------------------------------------------
;; auto-complete
;;------------------------------------------------------------------
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'auto-complete-config)
(require 'fuzzy)
(ac-config-default)
;; C-n/C-pで候補選択
(setq ac-use-menu-map t)

(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-mode-map (kbd "C-;") 'ac-fuzzy-complete)
(add-to-list 'ac-modes 'slim-mode 'rhtml-mode)
;;-----------------------------------------------------------------
