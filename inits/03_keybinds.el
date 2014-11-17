;;--------------------------------------------------------------------------------
;; キーバインド
;;--------------------------------------------------------------------------------
;; C-c C-cでコメントアウト
(define-key global-map "\C-c\C-c" 'comment-region)
;; C-c C-uでアンコメント
(define-key global-map "\C-c\C-u" 'uncomment-region)
;; C-uでundo
(define-key global-map "\C-u" 'undo)
;; C-hでバックスペース
(global-set-key "\C-h" 'backward-delete-char)
;; C-mで改行とインデント
(global-set-key "\C-m" 'newline-and-indent)
