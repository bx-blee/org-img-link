;;; -*- Mode: Emacs-Lisp; -*-

;;;#+BEGINNOT: bx:dblock:global:moded:file-insert :file "README.org"
;;;#+END:

;;; See ./README.org for description and instructions.


(lambda () "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
")


;; (xtn:org:link:img-link/activate)
(defun xtn:org:link:img-link/activate ()
  ""
  (interactive)
  (org-add-link-type
   "img-link"
   'xtn:org:link:img-link:path/proc   
   )
  )


(defun xtn:org:link:img-link:path/proc  (@path)
  ""
  (let (
	($linkDesc (xtn:org:link:description/get-at-point))
	)
    (when $linkDesc
      (org-open-link-from-string $linkDesc)
      )
    )
  )


(defun xtn:org:link:description/get-at-point ()
  (let* (
	($link (org-element-context))
	($begin (org-element-property :contents-begin $link))
	($end (org-element-property :contents-end $link))
	($result)
	)
    (unless (and $begin $end)
      (setq $result nil))
    (when (and $begin $end)
      (setq $result (buffer-substring $begin $end)))
    $result
    )
  )


(lambda () "
* Original code from John Kitchn -- See ./image-url-john.el
")


(defun img-link-overlays ()
  "Put image overlays on remote image urls."
  (interactive)
  (loop for img-link in (org-element-map (org-element-parse-buffer) 'link
               (lambda (link)
                 (when (string= "img-link" (org-element-property :type link))
                   link)))
    do
    (let* ((path (org-element-property :path img-link))
           (ov (make-overlay (org-element-property :begin img-link)
			     (org-element-property :end img-link)))
	   (tmp-file-path (expand-file-name
			   (concat (md5 path)
				   "."
				   (file-name-extension
				    path))
			   temporary-file-directory))
           (img)
	   )
      (unless (file-exists-p tmp-file-path)
	(url-copy-file path tmp-file-path)
	)
      (setq img (create-image tmp-file-path))
      (message (format "path=%s fileName=%s" path tmp-file-path))
      (overlay-put ov 'display img)
      (overlay-put ov 'img-link t))))

(defun img-link-clear-overlays ()
  "Remove overlays on img-links."
  (interactive)
  (require 'ov)
  (ov-clear 'img-link))

(provide 'org-img-link)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
