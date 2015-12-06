(require 'cl)

(load "~/.emacs.d/packages.el")

(setq evil-want-C-u-scroll t) ; fix C-u scrolling for evil
(setq evil-want-C-i-jump nil) ; fix TAB for evil
(evil-mode t)

;; theme
(load-theme 'sanityinc-tomorrow-eighties t)

;; tabs and indents
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;(setq-default tab-always-indent 'complete)

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

;; org mode
(add-hook 'org-mode-hook (lambda () (org-indent-mode t)) t)

(load "~/.emacs.d/escape.el")
(load "~/.emacs.d/helm.el")
(load "~/.emacs.d/powerline.el")
(load "~/.emacs.d/which-key.el")
(load "~/.emacs.d/leader.el")

(load "~/.emacs.d/lang/rust.el")
