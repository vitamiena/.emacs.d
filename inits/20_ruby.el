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
