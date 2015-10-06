(defpackage :fu-er-com.about
  (:use :cl :hunchentoot :cl-who :parenscript)
  (:export :start-server :stop-server))
(in-package :fu-er-com.about)

(define-easy-handler (about-page :uri "/about") ()
  (with-html-output-to-string (*standard-output* nil :prologue t)
    (:html
     (:head
      (:title "Fu-Er's Site")
      (:link :rel "stylesheet" :href "/main.css" :type "text/css"))
     (:body
      (str (fu-er-com::sidebar-css "About"))
      (:div :class "content"
            "about" (:br))))))
