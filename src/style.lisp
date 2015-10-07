(defpackage :fu-er-com.style
  (:use :cl :hunchentoot :cl-who :cl-css))
(in-package :fu-er-com.style)

(define-easy-handler (main-css :uri "/main.css") ()
  (let ((global-background-color "#c1b492")
        (banner-text-x "320px")
        (sidebar-width "250px")
        (sidebar-banner-height "227px")
        (sidebar-banner-avatar-x "40px")
        (sidebar-banner-avatar-y "34px")
        (text-color "#503222")
        (sidebar-nav-selected-color "#1f110a"))
    (setf (content-type*) "text/css")
    (css
     `(("html"
        :height "100%")

       ("body"
        :color ,text-color
        :margin "0"
        :padding "0"
        :height "100%")

       (".banner"
        :margin-left ,sidebar-width
        :height "148px"
        :width "auto"
        :position "relative"
        :margin "0px"
        :padding "0px"
        :z-index "0"
        :background-image "url(\"/banner_bg.png\")")

       (".banner-title"
        :font-family "redressed"
        :font-size "45px"
        :display "inline-block"
        :padding-left ,banner-text-x
        )

       (".content"
        :margin-left ,sidebar-width
        :height "calc(100% - 148px)" ; TODO: clean up
        :width "auto"
        :position "relative"
        :overflow "auto"
        :background-color ,global-background-color)

       ("@font-face"
        :font-family "redressed"
        :src "url(\"/AlegreyaSans-Medium.otf\")")

       (".sidebar"
        :position "fixed"
        :min-width ,sidebar-width
        :height "100%"
        :overflow "hidden"
        :background-color ,global-background-color)

       (".sidebar-banner"
        :position "absolute"
        :top "0px"
        :left "0px"
        :min-width ,sidebar-width
        :height ,sidebar-banner-height
        :z-index "1"
        :background-image "url(\"/sidebar_top.png\")")

       (".sidebar-banner-image"
        ; Centered
        :position "absolute"
        :top ,sidebar-banner-avatar-y
        :left ,sidebar-banner-avatar-x)

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

       (".sidebar-nav-text"
        :font-family "redressed"
        :font-size "40px")

       (".sidebar-nav-selected"
        :color ,sidebar-nav-selected-color)

       (".sidebar-nav"
        :list-style-type "none"
        :padding-left "20px"
        :margin "0px"
        :margin-top "-10px"
        :line-height "170%"
        :color ,text-color)

       (".sidebar-nav a"
        :color "inherit"
        :text-decoration "none")

       (".sidebar-sub-text"
        :font-family "redressed"
        :font-size "30px")

       (".sidebar-sub-nav"
        :list-style-type "none"
        :padding "0px"
        :margin-left "20px"
        :margin-bottom "20px"
        :line-height "120%"
        :color ,text-color)

       (".sidebar-sub-nav a"
        :color "inherit"
        :text-decoration "none")

       (".non-portfolio-content-background"
        :position "fixed"
        :bottom "0px"
        :right "0px"
        :z-index "100")
       ))))
