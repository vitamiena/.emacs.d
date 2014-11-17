;;-------------------------------------------------------------------
;;helm
;;-------------------------------------------------------------------

(global-set-key (kbd "C-x C-b") 'helm-mini)
(require 'helm-config)
(helm-mode t)
;; M-yでキルリングの履歴一覧を表示
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
;; helm modeでもC-hでバックスペース
(define-key helm-map (kbd "\C-h") 'delete-backward-char)
;; tabでディレクトリ移動
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;;------------------------------------------------------------------
