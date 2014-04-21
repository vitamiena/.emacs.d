;;--------------------------------------------------------------------------------
;; 基本設定
;;--------------------------------------------------------------------------------
(custom-set-variables
 '(auto-save-default nil)          ; 自動保存しない
 '(auto-save-list-file-name nil)   ; 自動保存ファイルの名前を記録しない
 '(auto-save-list-file-prefix nil) ; 自動保存ファイルリストを初期化しない
 '(delete-auto-save-files t)       ; 自動保存ファイルを削除
 '(inhibit-startup-screen t)       ; スタートアップ画面を非表示
 '(make-backup-files nil)          ; バックアップファイルを作成しない
 '(scroll-bar-mode nil)            ; スクロールバーなし
 '(transient-mark-mode t)          ; アクティブなリージョンをハイライト
 '(menu-bar-mode nil)              ; メニューバー非表示
 '(tool-bar-mode nil)              ; ツールバー非表示
 '(indent-tabs-mode nil)           ; タブを空白で入力 
 '(tab-width 2))                   ; タブ幅を指定
(global-linum-mode t)   ; 行番号表示
(set-face-attribute 'linum nil
                    :foreground "#089"
                    :height 0.9)
(setq linum-format "%2d ")

(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent)
;;--------------------------------------------------------------------------------
;; 対応する記号を自動補完
;;--------------------------------------------------------------------------------
(require 'skeleton)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?『 _ ?』))
(global-set-key (kbd "『") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?【 _ ?】))
(global-set-key (kbd "【") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?［ _ ?］))
(global-set-key (kbd "［") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?〔 _ ?〕))
(global-set-key (kbd "〔") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?〈 _ ?〉))
(global-set-key (kbd "〈") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?《 _ ?》))
(global-set-key (kbd "《") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?｛ _ ?｝))
(global-set-key (kbd "｛") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?「 _ ?」))
(global-set-key (kbd "「") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?（ _ ?）))
(global-set-key (kbd "（") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?‘ _ ’〕))
(global-set-key (kbd "‘") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?“ _ ?”))
(global-set-key (kbd "“") 'skeleton-pair-insert-maybe)
;;--------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------
;; キーバインド
;;--------------------------------------------------------------------------------

(define-key global-map "\C-c\C-c" 'comment-region)
(define-key global-map "\C-c\C-u" 'uncomment-region)
(define-key global-map "\C-u" 'undo)


;;--------------------------------------------------------------------------------
;; 対応する括弧をハイライト
;;--------------------------------------------------------------------------------
(show-paren-mode t)
(setq show-paren-style 'expression)                    ; 括弧内もハイライト
(set-face-background 'show-paren-match-face nil)       ; 背景色: なし
(set-face-underline-p 'show-paren-match-face "#C71585") ; 下線色:
(setq show-paren-delay 0) ; 表示までの秒数: 0秒
;;--------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------
;; ロードパス
;;--------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp")
;;--------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------
;; Twittering-mode
;;--------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp/twittering-mode")
(require 'twittering-mode)
(global-set-key "\C-ctw" 'twittering-mode)
;; OAuth認証を使う
(setq twittering-auth-method 'oauth)
;(load "~/.emacs.d/twitter_token")
(setq twittering-icon-mode t) ; アイコン表示 : 有効
(setq twittering-use-icon-storage t) ; アイコン保存 : 有効
(setq twittering-convert-fix-size 24) ; アイコンサイズ: 24px
(setq twittering-timer-interval 60) ; 更新間隔 : 60秒
;; タイムラインのフォーマット
(setq twittering-status-format
        "%i %s %@ %C{%y/%m/%d %H:%M}\n%t\n// from %f %RT{retweeted by %s}\n")
;; リツイートのフォーマット
(setq twittering-retweet-format " RT @%s: %t")
(defun twittering-mode-hook-func ()
  ;; ユーザ名とリンクを太字にする
  (set-face-bold-p 'twittering-username-face t)
  ;; ユーザー名とリンクの色
  (set-face-foreground 'twittering-username-face "DeepSkyBlue3")
  ;; URLとタイムスタンプの色
  (set-face-foreground 'twittering-uri-face "gray60")
  ;; Shift+f でお気に入り登録
  (define-key twittering-mode-map (kbd "F") 'twittering-favorite))
(add-hook 'twittering-mode-hook 'twittering-mode-hook-func)
;; 行番号表示を無効にする
(defadvice linum-on (around for-twit activate)
    (unless (memq major-mode '(twittering-mode twittering-edit-mode)) ad-do-it))
;;--------------------------------------------------------------------------------


;; 色設定
;;--------------------------------------------------------------------------------
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "white" :background "black"))))
 '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))
 '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box nil)))))
 ; 背景色:黒

;;--------------------------------------------------------------------------------
;; 補完
;;--------------------------------------------------------------------------------
;; バッファー名の問い合わせで大文字小文字の区別をしない
(setq read-buffer-completion-ignore-case t)
;; ファイル名の問い合わせで大文字小文字の区別をしない
(setq read-file-name-completion-ignore-case t)

;;-------------------------------------------------------------------------------
;;パッケージ
;;-------------------------------------------------------------------------------

(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; 初期化
(package-initialize)

;;-------------------------------------------------------------------
;;helm
;;-------------------------------------------------------------------

(require 'helm-config)
(helm-mode t)

(global-set-key (kbd "C-x C-b") 'helm-mini)
;;------------------------------------------------------------------

(require 'rhtml-mode )

(require 'projectile)
(projectile-global-mode)

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(setq echo-keystrokes 0.1)
(setq projectile-completion-system 'grizzl)

(require 'recentf-ext)
(setq recentf-max-saved-items 5000)

(require 'coffee-mode)
(require 'auto-complete)
