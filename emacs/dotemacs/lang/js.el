(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(eval-after-load "js2-mode"
  '(progn
     (setq js2-basic-offset 2)
     )
  )
