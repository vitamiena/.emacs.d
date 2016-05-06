(setq auto-mode-alist
      (append (list
               '("\\.rs" . rust-mode)
               '("\\.toml" . toml-mode)
               auto-mode-alist)))

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
