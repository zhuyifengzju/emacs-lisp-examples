;; http://ergoemacs.org/emacs/elisp_examples.html
;;Insert text
(defun insert-p-tag()
  "Insert <p></p> at cursor point."
  (interactive)
  (insert"<p></p>")
  (backward-char 4))

;; Insert around region
(defun wrap-b-region()
  "Insert a markup <b></b> around a region"
  (interactive)
  (save-excursion ;; The cursor will be at the same place as it was
    (goto-char (region-end))
    (insert"</b>")
    (goto-char (region-beginning))
    (insert "<b>")))

;; Select current word using program
(transient-mark-mode 1)
(defun select-current-word()
  (interactive)
  (let (pt)
    (skip-chars-backward "-_A-Za-z0-9")
    (setq pt (point))
    (skip-chars-forward "-_A-Za-z0-9")
    (set-mark pt)))


