(defpackage :fu-er-com
  (:use :cl :hunchentoot :cl-who :parenscript))
(in-package :fu-er-com)

(defun sidebar-css (&optional selected)
  (unless selected
    (setq selected "Portfolio"))

  (with-html-output-to-string (*standard-output* nil)
    (htm
      (:div :class "sidebar sidebar-text"
       (:div :class "sidebar-banner"
        (:img :class "sidebar-banner-image"
         :src "/avatar_1.png"))
       (:div :class "sidebar-content"
        (:nav
          (:ul :class "sidebar-nav"
           (dolist (cat '("Portfolio" "About" "Resume" "Links"))
             (cond ((string-equal cat selected)
                    (htm (:li :class "sidebar-nav-selected"
                           (:a
                             :href (concatenate 'string "/"
                                                (string-downcase cat))
                             (str cat)))))
                   (t
                    (htm (:li
                           (:a
                             :href (concatenate 'string "/"
                                                (string-downcase cat))
                           (str cat))))))))))))))

(define-easy-handler (main-page :uri "/") ()
  (redirect "/portfolio"))
