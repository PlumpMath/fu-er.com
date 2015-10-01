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
      :margin-left "200px"
      :height "100%"
      :width "auto"
      :position "relative"
      :overflow "auto"
      :background-color "blue")

     (".sidebar"
      :position "fixed"
      :min-width "200px"
      :height "100%"
      :overflow "hidden"
      :background-color "red")

     (".sidebar-banner"
      :position "absolute"
      :top "0px"
      :left "0px"
      :min-width "200px"
      :height "200px"
      :background-color "grey")

     (".sidebar-content"
      :position "absolute"
      :top "200px"
      :left "0px"
      :bottom "0px"
      :overflow "auto"
      :min-width "200px"
      :background-color "green"

      ; Move the scroll bar out of sight
      :max-height "100%"
      :margin-right "-100px"
      :padding-right "100px")

     (".sidebar-nav"
       :list-style-type "none")

     )))
