(defpackage :fu-er-com.portfolio
  (:use :cl :hunchentoot :cl-who :parenscript)
  (:export :start-server :stop-server))
(in-package :fu-er-com.portfolio)

(define-easy-handler (portfolio :uri "/portfolio") (category)
  (with-html-output-to-string (*standard-output* nil :prologue t)
    (:html
     (:head
      (:title "Fu-Er's Site")
      (:link :rel "stylesheet" :href "/main.css" :type "text/css"))
     (:body
      (str (fu-er-com::sidebar-css (or category "Portfolio")))
      (:div :class "content"
            "content" (:br)
            )))))
