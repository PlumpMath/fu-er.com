(defpackage :fu-er-com.about
  (:use :cl :hunchentoot :cl-who :parenscript)
  (:export :start-server :stop-server))
(in-package :fu-er-com.about)

(define-easy-handler (about-page :uri "/about") ()
  (fu-er-com::standard-page
    "About"
    (with-html-output-to-string (*standard-output* nil :prologue t)
      "about content" (:br)
      "new line")))
