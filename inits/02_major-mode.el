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
