(defpackage :jank-repl.style
  (:use :cl :hunchentoot :cl-who :cl-css))
(in-package :jank-repl.style)

(define-easy-handler (main-css :uri "/main.css") ()
  (setf (content-type*) "text/css")
  (css
   `(("html"
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
      :z-index "1"
      :background-color "blue")

     (".sidebar"
      :position "fixed"
      :min-width "300px"
      :height "100%"
      :background-color "red")

     )))
