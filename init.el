;;--------------------------------------------------------------------------------
;; 基本設定
;;--------------------------------------------------------------------------------
;;; 行番号を表示
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#089"
                    :height 0.9)
(setq linum-format "%2d ")
;; 文字コード
(set-language-environment "japanese")
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
;; インデント
(setq-default tab-width 2) ;; タブ幅
(setq-default indent-tabs-mode nil) ;; タブを空白に
(defun indent-set ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset   2) ;; ブロック内のインデント数
  (setq tab-width        2) ;; タブのインデント数
)
(setq indent-line-function 'indent-relative-maybe)
;; 対応する括弧を強調
(show-paren-mode t)
(set-face-background 'show-paren-match-face nil)       ; 背景色: なし
(set-face-underline-p 'show-paren-match-face "#C71585") ; 下線色:
(setq show-paren-delay 0) ; 表示までの秒数: 0秒
;; 行末の空白を保存時に削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; 自動保存の設定
(custom-set-variables
 '(auto-save-default nil)          ; 自動保存しない
 '(auto-save-list-file-name nil)   ; 自動保存ファイルの名前を記録しない
 '(auto-save-list-file-prefix nil) ; 自動保存ファイルリストを初期化しない
 '(delete-auto-save-files t))       ; 自動保存ファイルを削除
;; その他
(custom-set-variables
 '(inhibit-startup-screen t)       ; スタートアップ画面を非表示
 '(make-backup-files nil)          ; バックアップファイルを作成しない
 '(scroll-bar-mode nil)            ; スクロールバーなし
 '(transient-mark-mode t)          ; アクティブなリージョンをハイライト
 '(menu-bar-mode nil)              ; メニューバー非表示
 '(tool-bar-mode nil))              ; ツールバー非表示
;;-------------------------------------------------------------------------------

;;-------------------------------------------------------------------------------
;;packege.el
;;-------------------------------------------------------------------------------
;; (require 'package)
;; ;; MELPAを追加
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; ;; Marmaladeを追加
;; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; ;; 初期化
;; (package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
;;-----------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------
;; ロードパス
;;--------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;;--------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------
;; 対応する記号を自動補完
;;--------------------------------------------------------------------------------
;; (require 'skeleton)
;; (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "<") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?『 _ ?』))
;; (global-set-key (kbd "『") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?【 _ ?】))
;; (global-set-key (kbd "【") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?［ _ ?］))
;; (global-set-key (kbd "［") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?〔 _ ?〕))
;; (global-set-key (kbd "〔") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?〈 _ ?〉))
;; (global-set-key (kbd "〈") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?《 _ ?》))
;; (global-set-key (kbd "《") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?｛ _ ?｝))
;; (global-set-key (kbd "｛") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?「 _ ?」))
;; (global-set-key (kbd "「") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?（ _ ?）))
;; (global-set-key (kbd "（") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?‘ _ ’〕))
;; (global-set-key (kbd "‘") 'skeleton-pair-insert-maybe)
;; (add-to-list 'skeleton-pair-alist '(?“ _ ?”))
;; (global-set-key (kbd "“") 'skeleton-pair-insert-maybe)
(require 'smartparens-config)
(smartparens-global-mode t)
;;--------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------
;; syntax-check
;;--------------------------------------------------------------------------------
;; flycheckを使用
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(custom-set-variables
       '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
;;--------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------
;; メジャーモード
;;--------------------------------------------------------------------------------
;; zshrcをsh-modeに
(setq auto-mode-alist
      (append '(("zshrc" . sh-mode))
              auto-mode-alist))
;; caskをemacs-lisp-mode
(setq auto-mode-alist
      (append '(("Cask" . emacs-lisp-mode))
              auto-mode-alist))
;;--------------------------------------------------------------------------------

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


;;--------------------------------------------------------------------------------
;; Twittering-mode
;;--------------------------------------------------------------------------------
;; (add-to-list 'load-path "~/.emacs.d/elisp/twittering-mode")
;; (require 'twittering-mode)
;; (global-set-key "\C-ctw" 'twittering-mode)
;; ;; OAuth認証を使う
;; (setq twittering-auth-method 'oauth)
;; ;(load "~/.emacs.d/twitter_token")
;; (setq twittering-icon-mode t) ; アイコン表示 : 有効
;; (setq twittering-use-icon-storage t) ; アイコン保存 : 有効
;; (setq twittering-convert-fix-size 24) ; アイコンサイズ: 24px
;; (setq twittering-timer-interval 60) ; 更新間隔 : 60秒
;; ;; タイムラインのフォーマット
;; (setq twittering-status-format
;;         "%i %s %@ %C{%y/%m/%d %H:%M}\n%t\n// from %f %RT{retweeted by %s}\n")
;; ;; リツイートのフォーマット
;; (setq twittering-retweet-format " RT @%s: %t")
;; (defun twittering-mode-hook-func ()
;;   ;; ユーザ名とリンクを太字にする
;;   (set-face-bold-p 'twittering-username-face t)
;;   ;; ユーザー名とリンクの色
;;   (set-face-foreground 'twittering-username-face "DeepSkyBlue3")
;;   ;; URLとタイムスタンプの色
;;   (set-face-foreground 'twittering-uri-face "gray60")
;;   ;; Shift+f でお気に入り登録
;;   (define-key twittering-mode-map (kbd "F") 'twittering-favorite))
;; (add-hook 'twittering-mode-hook 'twittering-mode-hook-func)
;; ;; 行番号表示を無効にする
;; (defadvice linum-on (around for-twit activate)
;;     (unless (memq major-mode '(twittering-mode twittering-edit-mode)) ad-do-it))
;;--------------------------------------------------------------------------------

;;-------------------------------------------------------------------------------
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

;;-----------------------------------------------------------------
;; ruby
;;-----------------------------------------------------------------
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
;; .rb Capfile GemfileをRubyファイルと認識
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)
;;;; endの自動挿入がうまくいかない...
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))
;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-heilight-toggle t)
;; Ruby デバッガの設定
(autoload 'rubydb "rubydb3x"
    "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)
;;-------------------------------------------------------------------

;;-------------------------------------------------------------------
;; rails
;;-------------------------------------------------------------------
(require 'rhtml-mode)
(require 'slim-mode)
(require 'coffee-mode)
;; projective-rails
(require 'projectile)
(projectile-global-mode)
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq echo-keystrokes 0.1)
(setq projectile-completion-system 'grizzl)

(require 'recentf-ext)
(setq recentf-max-saved-items 5000)


;;
(defun ruby-mode-set-encoding () ())

;;------------------------------------------------------------------------------------
;; org-mode
;;------------------------------------------------------------------------------------

;; org-modeの初期化
(require 'org-install)
;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ
(setq org-directory "~/org/")
;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")
