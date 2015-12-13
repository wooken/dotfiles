(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(eval-after-load "js2-mode"
  '(progn
     (setq js2-basic-offset 2)

     (defun npm-test ()
       (interactive)
       (save-buffer)
       (if (locate-dominating-file default-directory "package.json")
           (compile "npm test")
         )
       )

     (add-hook 'js2-mode-hook
               (lambda ()
                 (which-key-add-key-based-replacements "SPC m" "node.js")
                 (evil-leader/set-key "m t" 'npm-test)
                 )
               )
     )
  )
