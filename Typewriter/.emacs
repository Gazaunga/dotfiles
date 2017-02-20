; get melpa going
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

; open .fountain files in fountain-mode
(add-to-list 'auto-mode-alist '("\\.fountain$" . fountain-mode))

; don't wrap in the middle of words when writing prose
(add-hook 'text-mode-hook 'turn-on-visual-line-mode nil)

; bye bye menu bar
(menu-bar-mode -1)

; have writeroom style large margins when writing prose
(defun my-set-margins ()
  "Set margins in current buffer."
  (setq left-margin-width 20)
  (setq right-margin-width 20))

(add-hook 'text-mode-hook 'my-set-margins)

; cool org-mode navigation
; try it by pressing j in the beginning of a headline with speed keys on
(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)

; activate speed keys
(setq org-use-speed-commands t)

; put a clock and a battery indicator in the mode line but don't show mail
; nice to have if you've hidden the tmux status line
(setq display-time-24hr-format t)
(display-battery-mode 1)
(display-time-mode 1)
(setq display-time-mail-string "")
