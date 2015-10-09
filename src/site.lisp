(defpackage :fu-er-com
  (:use :cl :hunchentoot :cl-who :parenscript))
(in-package :fu-er-com)

(defun random-avatar ()
  (let* ((avatars (directory "www/img/avatar/*.png"))
         (index (random (length avatars))))
    (concatenate 'string
                 "/img/avatar/"
                 (file-namestring (nth index avatars)))))

(defun sidebar (selected)
  (with-html-output-to-string (*standard-output* nil)
    (htm
      (:div :class "sidebar sidebar-nav-text"
       (:div :class "sidebar-banner"
        (:a :href "/"
          (:img :class "sidebar-banner-image"
                :src (str (random-avatar)))))
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

(defun standard-page (selected body)
  (with-html-output-to-string (*standard-output* nil :prologue t)
    (:html
     (:head
      (:title (str (concatenate 'string
                                "Fu-Er | "
                                (string-capitalize selected))))
      (:link :rel "stylesheet" :href "/main.css" :type "text/css"))
     (:body
      (str (sidebar selected))
      (:div :class "content"
       (:div :class "banner"
         (:h2 :class "banner-title" (str (string-capitalize selected))))
            (str body))))))

(defun non-portfolio-content-background ()
  (with-html-output-to-string (*standard-output* nil)
      (:img :class "non-portfolio-content-background"
            :src "/img/non-portfolio/background.png")))

(define-easy-handler (main-page :uri "/") ()
  (redirect "/portfolio"))
