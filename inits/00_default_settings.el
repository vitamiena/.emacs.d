;;;--------------------------------------------------------------------------------
;;; 基本設定
;;;--------------------------------------------------------------------------------
;;; 行番号を表示
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#089"
                    :height 0.9)
(setq linum-format "%3d ")
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
(set-face-underline 'show-paren-match-face "#C71585") ; 下線色:
(setq show-paren-delay 0) ; 表示までの秒数: 0秒
;; 右括弧が挿入されると括弧の中に
(when (require 'cursor-in-brackets nil t)
  (global-cursor-in-brackets-mode t))
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

;;--------------------------------------------------------------------------------
;; 補完
;;--------------------------------------------------------------------------------
;; バッファー名の問い合わせで大文字小文字の区別をしない
(setq read-buffer-completion-ignore-case t)
;; ファイル名の問い合わせで大文字小文字の区別をしない
(setq read-file-name-completion-ignore-case t)
