(defpackage :jank-repl.style
  (:use :cl :hunchentoot :cl-who :cl-css))
(in-package :jank-repl.style)

(define-easy-handler (main-css :uri "/main.css") ()
  (let ((global-background-color '(:background-color "#c1b492"))
        (sidebar-width "250px")
        (sidebar-banner-height "227px")
        (sidebar-banner-avater-x "40px")
        (sidebar-banner-avater-y "34px"))
    (setf (content-type*) "text/css")
    (css
    `(("html"
        :height "100%")

        ("body"
        :margin "0"
        :padding "0"
        :height "100%")

        (".content"
        :margin-left ,sidebar-width
        :height "100%"
        :width "auto"
        :position "relative"
        :overflow "auto"
        ,@global-background-color)

        (".sidebar"
        :position "fixed"
        :min-width ,sidebar-width
        :height "100%"
        :overflow "hidden"
        ,@global-background-color)

        (".sidebar-banner"
        :position "absolute"
        :top "0px"
        :left "0px"
        :min-width ,sidebar-width
        :height ,sidebar-banner-height
        :background-image "url(\"/sidebar_top.png\")")

        (".sidebar-banner-image"
        ; Centered
        ; TODO: fudged
        :position "absolute"
        :top ,sidebar-banner-avater-y
        :left ,sidebar-banner-avater-x)

        (".sidebar-content"
        :position "absolute"
        :top ,sidebar-banner-height
        :left "0px"
        :bottom "0px"
        :overflow "auto"
        :min-width ,sidebar-width

        ; Move the scroll bar out of sight
        :max-height "100%"
        :margin-right "-100px"
        :padding-right "100px"

        :background-image "url(\"/sidebar_body.png\")"
        :background-repeat "repeat-y")

        (".sidebar-nav"
        :list-style-type "none")
        ))))
