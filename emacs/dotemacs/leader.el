(global-evil-leader-mode t)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key "b" 'helm-buffers-list)
(evil-leader/set-key "c" 'mode-specific-command-prefix)
(evil-leader/set-key "f" 'helm-find-files)
(evil-leader/set-key "h" help-map)
(evil-leader/set-key "x" 'helm-M-x)
