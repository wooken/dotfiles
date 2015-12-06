(global-evil-leader-mode t)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key "f" 'helm-find-files)
(evil-leader/set-key "h" help-map)
(evil-leader/set-key "x" 'helm-M-x)

(which-key-add-key-based-replacements "SPC b" "buffers")
(which-key-add-key-based-replacements "SPC h" "help")

;; buffers
(defvar buffer-map (make-sparse-keymap))
(evil-leader/set-key "b" buffer-map)
(evil-leader/set-key "b l" 'helm-buffers-list)
(evil-leader/set-key "b q" 'kill-this-buffer)

;; clipboard
(load "~/.emacs.d/clipboard.el")
(defvar clipboard-map (make-sparse-keymap))
(evil-leader/set-key "y" clipboard-map)
(which-key-add-key-based-replacements
  "SPC y" "clipboard")
(evil-leader/set-key "y p" 'paste-from-clipboard)
(evil-leader/set-key "y y" 'copy-to-clipboard)
