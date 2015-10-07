(defpackage :fu-er-com.portfolio
  (:use :cl :hunchentoot :cl-who :parenscript)
  (:export :start-server :stop-server))
(in-package :fu-er-com.portfolio)

(define-easy-handler (portfolio :uri "/portfolio") (category)
  (fu-er-com::standard-page
    (or category "Portfolio")
    (with-html-output-to-string (*standard-output* nil :prologue t)
      "content" (:br))))
