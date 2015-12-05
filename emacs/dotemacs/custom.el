(setq evil-want-C-u-scroll t) ; fix C-u scrolling for evil
(require 'evil)
(evil-mode t)

;; theme
(load-theme 'spacemacs-dark t)

;; disable some visual bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; enable syntax highlighting
(global-font-lock-mode t)

;; enable line numbers
(global-linum-mode t)

;; vi undo
(setq evil-want-fine-undo t)

;; persistent search hl
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; show matching parentheses
(show-smartparens-global-mode t)

;; disable symlink question
(setq vc-follow-symlinks nil)

;; whitespace
(global-whitespace-mode t)
(setq whitespace-style '(face tabs trailing))

;; undo
(setq evil-want-fine-undo nil)
