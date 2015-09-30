(defpackage :jank-repl.style
  (:use :cl :hunchentoot :cl-who :cl-css))
(in-package :jank-repl.style)

(define-easy-handler (main-css :uri "/main.css") ()
  (setf (content-type*) "text/css")
  (css
   `(("body"
      :height "100%")
     
     ("#container"
      :display "table"
      :background-color "green"
      :height "260px")

     ("#main"
      :display "table-cell"
      :vertical-align "top"
      :background-color "blue"
      :width "100%")

     ("#sidebar"
      :min-width "80px"
      :display "table-cell"
      :vertical-align "top"
      :background-color "red"
      :position "relative")

     ("#sidebar-bottom"
      :width "30px"
      :height "30px"
      :background-color "brown"
      :position "absolute"
      :bottom "0"))))
