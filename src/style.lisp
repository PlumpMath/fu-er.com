(defpackage :jank-repl.style
  (:use :cl :hunchentoot :cl-who :cl-css))
(in-package :jank-repl.style)

(define-easy-handler (main-css :uri "/main.css") ()
  (setf (content-type*) "text/css")
  (css
   '(("html"
      :height "100%")
     
     ("body"
      :margin "0"
      :padding "0"
      :height "100%")

     (".content"
      :margin-left "300px"
      :height "100%"
      :width "auto"
      :position "relative"
      :overflow "auto"
      :background-color "blue")

     (".sidebar"
      :position "fixed"
      :min-width "300px"
      :height "100%"
      :background-color "red")

     (".sidebar-banner"
      :position "fixed"
      :min-width "300px"
      :height "200px"
      :background-color "grey")

     (".sidebar-content"
      :position "fixed"
      :top "200px"
      :left "0px"
      :height "100%"
      :min-width "300px"
      :background-color "green")

     )))
