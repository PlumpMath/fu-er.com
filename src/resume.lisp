(defpackage :fu-er-com.resume
  (:use :cl :hunchentoot :cl-who :parenscript))
(in-package :fu-er-com.resume)

(define-easy-handler (about-page :uri "/resume") ()
  (fu-er-com::standard-page
    "Resume"
    (with-html-output-to-string (*standard-output* nil)
      (str (fu-er-com::non-portfolio-content-background))
      "resume content" (:br)
          )))
