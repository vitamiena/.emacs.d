;;-------------------------------------------------------------------
;; rails
;;-------------------------------------------------------------------
(require 'slim-mode)
(require 'coffee-mode)
;; projective-rails
(require 'projectile)
(projectile-mode)
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq echo-keystrokes 0.1)
(setq projectile-completion-system 'grizzl)

(require 'recentf-ext)
(setq recentf-max-saved-items 5000)


;;
(defun ruby-mode-set-encoding () ())
