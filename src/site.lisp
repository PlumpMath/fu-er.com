(defpackage :fu-er-com
  (:use :cl :hunchentoot :cl-who :parenscript))
(in-package :fu-er-com)

(defun sidebar-css (selected)
  (with-html-output-to-string (*standard-output* nil)
    (htm
      (:div :class "sidebar sidebar-nav-text"
       (:div :class "sidebar-banner"
        (:a :href "/"
          (:img :class "sidebar-banner-image"
                :src "/avatar_1.png")))
       (:div :class "sidebar-content"
        (:nav
          (:ul :class "sidebar-nav"
           (if (string-equal selected "Portfolio")
             (htm
               (:li :class "sidebar-nav-selected"
                  (:a :href "/portfolio"
                  "Portfolio")))
             (htm
               (:li (:a :href "/portfolio" "Portfolio"))))

           (:ul :class "sidebar-sub-nav sidebar-sub-text"
             (dolist (cat '("games" "vector" "raster" "sketches"))
               (cond ((string-equal cat selected)
                    (htm (:li :class "sidebar-nav-selected"
                           (:a
                             :href (concatenate 'string "/portfolio?category="
                                                cat)
                             (str (string-capitalize cat))))))
                   (t
                    (htm (:li
                           (:a
                             :href (concatenate 'string "/portfolio?category="
                                                cat)
                           (str (string-capitalize cat)))))))))

           (dolist (cat '("About" "Resume" "Links"))
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
