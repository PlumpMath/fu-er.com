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
     
     ("#container"
      :display "table"
      :background-color "green"
      :height "100%")

     ("#main"
      :display "table-cell"
      :vertical-align "top"
      :background-color "blue"
      :width "100%")

     ("#sidebar"
      :min-width "300px"
      :display "table-cell"
      :vertical-align "top"
      :background-color "red"
      :position "relative")

     ("#sidebar-bottom"
      :width "300px"
      :height "50px"
      :background-color "brown"
      :position "absolute"
      :bottom "0"))))
