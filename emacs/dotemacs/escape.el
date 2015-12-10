(evil-escape-mode t)
(setq-default evil-escape-inhibit t)
(define-key evil-insert-state-map (kbd "C-c") 'evil-escape)
(define-key evil-visual-state-map (kbd "C-c") 'evil-escape)
