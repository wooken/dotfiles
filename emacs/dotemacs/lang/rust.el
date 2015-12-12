(eval-after-load "rust"
  '(progn
    (defun rust-save-and-test ()
      (interactive)
      (save-buffer)
      (if (locate-dominating-file (buffer-file-name) "Cargo.toml")
          (compile "cargo test")
        ))

    (defun rust-save-and-run ()
      (interactive)
      (save-buffer)
      (if (locate-dominating-file (buffer-file-name) "Cargo.toml")
          (compile "cargo run")
        ))

    (add-hook 'rust-mode-hook
              (lambda ()
                                        ;(electric-indent-mode 0)
                (which-key-add-key-based-replacements "SPC m" "rust")
                (evil-leader/set-key "m t" 'rust-save-and-test)
                (evil-leader/set-key "m r" 'rust-save-and-run)))
    )
  )
