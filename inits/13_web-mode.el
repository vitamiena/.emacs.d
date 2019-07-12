;;--------------------------------------------------------------------------------
;; web-mode
;;--------------------------------------------------------------------------------
;;; 適用する拡張子
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.json?$"     . web-mode))

;;; インデント数
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset   2)
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'my-web-mode-hook)
;; color:#ff0000;等とした場合に指定した色をbgに表示しない
;;(setq web-mode-disable-css-colorization t)
;;css,js,php,etc..の範囲をbg色で表示
(setq web-mode-enable-block-faces t)
(custom-set-faces
 '(web-mode-server-face
   ((t (:background "grey"))))                  ; template Blockの背景色
 '(web-mode-css-face
   ((t (:background "grey18"))))                ; CSS Blockの背景色
 '(web-mode-javascript-face
   ((t (:background "grey36"))))                ; javascript Blockの背景色
 )
(setq web-mode-enable-heredoc-fontification t)
;; 色の設定
(custom-set-faces
 '(web-mode-doctype-face
   ((t (:foreground "#82AE46"))))                          ; doctype
 '(web-mode-html-tag-face
   ((t (:foreground "#E6B422" :weight bold))))             ; 要素名
 '(web-mode-html-attr-name-face
   ((t (:foreground "#C97586"))))                          ; 属性名など
 '(web-mode-html-attr-value-face
   ((t (:foreground "#82AE46"))))                          ; 属性値
 '(web-mode-comment-face
   ((t (:foreground "#D9333F"))))                          ; コメント
 '(web-mode-server-comment-face
   ((t (:foreground "#D9333F"))))                          ; コメント
 '(web-mode-css-rule-face
   ((t (:foreground "#A0D8EF"))))                          ; cssのタグ
 '(web-mode-css-pseudo-class-face
   ((t (:foreground "#FF7F00"))))                          ; css 疑似クラス
 '(web-mode-css-at-rule-face
   ((t (:foreground "#FF7F00"))))                          ; cssのタグ
 )
;;--------------------------------------------------------------------------------
