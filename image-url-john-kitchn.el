;;; -*- Mode: Emacs-Lisp; -*-

;; Original code from John Kitchn

;; Then use it like this: [[image-url:https://d1ra4hr810e003.cloudfront.net/media/27FB7F0C-9885-42A6-9E0C19C35242B5AC/0/D968A2D0-35B8-41C6-A94A0C5C5FCA0725/F0E9E3EC-8F99-4ED8-A40DADEAF7A011A5/dbe669e9-40be-51c9-a9a0-001b0e022be7/thul-IMG_2100.jpg]]

;; [[image-url:http://www.neda.com/images/neda.jpg][http://www.neda.com]]

;; [[image-url:http://www.neda.com/images/neda.jpg]]

(org-add-link-type
 "image-url"
 (lambda (path)
   (let ((img (expand-file-name
           (concat (md5 path) "." (file-name-extension path))
           temporary-file-directory)))
     (if (file-exists-p img)
     (find-file img)
       (url-copy-file path img)
       (find-file img)))))

;; (image-url-clear-overlays)
(defun image-url-overlays ()
  "Put image overlays on remote image urls."
  (interactive)
  (loop for image-url in (org-element-map (org-element-parse-buffer) 'link
               (lambda (link)
                 (when (string= "image-url" (org-element-property :type link))
                   link)))
    do
    (let* ((path (org-element-property :path image-url))
           (ov (make-overlay (org-element-property :begin image-url)
                 (org-element-property :end image-url)))
           (img (create-image (expand-file-name
                   (concat (md5 path)
                       "."
                       (file-name-extension
                        path))
                   temporary-file-directory))))
      (overlay-put ov 'display img)
      (overlay-put ov 'image-url t))))

;; (image-url-clear-overlays)
(defun image-url-clear-overlays ()
  "Reove overlays on image-urls."
  (interactive)
  (require 'ov)
  (ov-clear 'image-url))
