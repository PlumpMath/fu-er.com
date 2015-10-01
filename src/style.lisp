(defpackage :jank-repl.style
  (:use :cl :hunchentoot :cl-who :cl-css))
(in-package :jank-repl.style)

(define-easy-handler (main-css :uri "/main.css") ()
  (let ((global-background-color '(:background-color "#c9c4b3")))
    (setf (content-type*) "text/css")
    (css
    `(("html"
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
        ,@global-background-color)

        (".sidebar"
        :position "fixed"
        :min-width "200px"
        :height "100%"
        :overflow "hidden"
        ,@global-background-color)

        (".sidebar-banner"
        :position "absolute"
        :top "0px"
        :left "0px"
        :min-width "200px"
        :height "200px"
        :background-image "url(\"/sidebar_top.png\")")

        (".sidebar-banner-image"
        ; Centered
        :position "absolute"
        :top "25px"
        :left "25px"

        :width "150px"
        :height "150px")

        (".sidebar-content"
        :position "absolute"
        :top "200px"
        :left "0px"
        :bottom "0px"
        :overflow "auto"
        :min-width "200px"

        ; Move the scroll bar out of sight
        :max-height "100%"
        :margin-right "-100px"
        :padding-right "100px"

        :background-image "url(\"/sidebar_body.png\")")

        (".sidebar-nav"
        :list-style-type "none")
        ))))
