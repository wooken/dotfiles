(global-evil-leader-mode t)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key "b" 'helm-buffers-list)
(evil-leader/set-key "c" 'mode-specific-command-prefix)
(evil-leader/set-key "f" 'helm-find-files)
(evil-leader/set-key "h" help-map)
(evil-leader/set-key "x" 'helm-M-x)

(which-key-add-key-based-replacements "SPC h" "help")

;; clipboard
(load "~/.emacs.d/clipboard.el")
(defvar clipboard-map (make-sparse-keymap))
(evil-leader/set-key "y" clipboard-map)
(which-key-add-key-based-replacements
  "SPC y" "clipboard")
(evil-leader/set-key "y y" 'copy-to-clipboard)
(evil-leader/set-key "y p" 'paste-from-clipboard)
