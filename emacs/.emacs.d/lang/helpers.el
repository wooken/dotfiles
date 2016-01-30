;; Shut up compile saves
(setq compilation-ask-about-save nil)
;;; Don't save *anything*
(setq compilation-save-buffers-predicate '(lambda () nil))
