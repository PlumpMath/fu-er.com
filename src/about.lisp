(defpackage :fu-er-com.about
  (:use :cl :hunchentoot :cl-who :parenscript))
(in-package :fu-er-com.about)

(define-easy-handler (about-page :uri "/about") ()
  (fu-er-com::standard-page
    "About"
    (with-html-output-to-string (*standard-output* nil)
      (str (fu-er-com::non-portfolio-content-background))
      "about content" (:br)
          )))
