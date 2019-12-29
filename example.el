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


;; https://github.com/xahlee/lookup-word-on-internet/blob/master/xah-lookup.el
;; Lookup command in wikipedia
(defun my-lookup-wikipedia ()
  "Look up the word under cursor in wikipedia. This command would switch to browser"
  (interactive)
  (let (word)
    (setq word
	  (if (use-region-p)
	      (buffer-substring-no-properties (region-beginning) (region-end))
	    (current-word)))
    (setq word (replace-regexp-in-string " " "_" word))
    (browse-url (concat "http://en.wikipedia.org/wiki/" word))
    ))

;; If I want to highlight message in certain files.
(defun highlite-it ()
  "Hight certain lines..."
  (interactive)
  (if (equal "log" (file-name-extension (buffer-file-name)))
      (progn
	(highlight-lines-matching-regexp "ERROR:" 'hi-red-b)
	(highlight-lines-matching-regexp "NOTE:" 'hi-blue-b))))
(add-hook 'find-file-hook 'highlite-it)

