(defun rust-save-and-test ()
  (interactive)
  (save-buffer)
  (if (locate-dominating-file (buffer-file-name) "Cargo.toml")
      (compile "cargo test")
    ))

(add-hook 'rust-mode-hook
          (lambda ()
            (which-key-add-key-based-replacements "SPC m" "rust")
            (evil-leader/set-key "m t" 'rust-save-and-test)))
