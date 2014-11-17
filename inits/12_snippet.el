;;--------------------------------------------------------------------------------
;; snipet
;;--------------------------------------------------------------------------------
;; yasnippetを置いているフォルダにパスを通す
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/.cask/24.4.1/elpa/yasnippet-20141102.1554"))

;; スニペットフォルダ
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/mySnippets"
        "~/.emacs.d/snippets/downloadSnippets"
        ))

;; yas起動
;; (yas-global-mode t)
;;--------------------------------------------------------------------------------
