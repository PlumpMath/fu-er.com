(defpackage :fu-er-com.links
  (:use :cl :hunchentoot :cl-who :parenscript))
(in-package :fu-er-com.links)

(define-easy-handler (about-page :uri "/links") ()
  (fu-er-com::standard-page
    "Links"
    (with-html-output-to-string (*standard-output* nil)
      (str (fu-er-com::non-portfolio-content-background))
      "links content" (:br)
          )))
