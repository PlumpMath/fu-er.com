(defpackage :fu-er-com.portfolio
  (:use :cl :hunchentoot :cl-who :parenscript)
  (:export :start-server :stop-server))
(in-package :fu-er-com.portfolio)

(define-easy-handler (portfolio :uri "/portfolio") ()
  (with-html-output-to-string (*standard-output* nil :prologue t)
    (:html
     (:head
      (:title "Fu-Er's Site")
      (:link :rel "stylesheet" :href "/main.css" :type "text/css"))
     (:body
      (str (fu-er-com::sidebar-css))
      (:div :class "content"
            "content" (:br)
            )))))
