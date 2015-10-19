(defpackage :fu-er-com.style
  (:use :cl :hunchentoot :cl-who :cl-css))
(in-package :fu-er-com.style)

(define-easy-handler (main-css :uri "/main.css") ()
  (let ((global-background-color "#c1b492")
        (banner-text-x "70px")
        (banner-height "148px")
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
        :font-family "alegrey"
        :font-size "30px"
        :color ,text-color
        :margin "0"
        :padding "0"
        :height "100%")

       (".banner"
        :margin-left ,sidebar-width
        :height ,banner-height
        :width "auto"
        :position "relative"
        :margin "0px"
        :padding-left "0px"
        :z-index "0"
        :background-image "url(\"/img/banner.png\")")

       (".banner-title"
        :font-size "45px"
        :display "inline-block"
        :padding-left ,banner-text-x)

       (".content"
        :margin-left ,sidebar-width
        :height "100%"
        :width "auto"
        :position "relative"
        :overflow "auto"
        :background-color ,global-background-color)

       ("@font-face"
        :font-family "alegrey"
        :src "url(\"/font/alegreysans-medium.otf\")")

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
        :z-index "10"
        :background-image "url(\"/img/sidebar/top.png\")")

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
        :z-index "10"
        :min-width ,sidebar-width

        ; Move the scroll bar out of sight
        :max-height "100%"
        :margin-right "-100px"
        :padding-right "100px"

        :background-image "url(\"/img/sidebar/body.png\")"
        :background-repeat "repeat-y")

       (".sidebar-nav-text"
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

       (".portfolio-article"
        :margin-top "50px"
        :margin-left "70px"
        :min-height "332px") ; TODO variable

       (".portfolio-article-link"
        :color "inherit"
        :text-decoration "none")

       (".portfolio-article-image"
        :float "left"
        :padding-right "30px")

       (".portfolio-article-title"
        :font-size "44px"
        :font-weight "bold"
        :margin "0px"
        :padding "0px")

       (".portfolio-article-rank"
        :font-size "40px"
        :font-style "italic"
        :font-weight "normal"
        :margin "0px"
        :padding "0px")

       (".portfolio-overlay"
        :visibility "hidden"
        :position "absolute"
        :left "0px"
        :top "0px"
        :width "100%"
        :height "100%"
        :text-align "center"
        :z-index "11"
        :background-image "url(\"/img/portfolio/transparent-50.png\")") ; TODO: image

       (".portfolio-overlay-modal"
        :width "80%"
        :height "80%"
        :margin "100px auto" ; Centered
        :background-color ,global-background-color
        :border "1px solid"
        :border-color ,text-color
        :padding "0px"
        :text-align "left")

       (".portfolio-overlay-article"
        )

       ("#portfolio-overlay-article-image"
        :position "absolute"
        :top "20%"
        :left "10%"
        :max-width "80%"
        :max-height "60%"
        :margin-left "10px"
        )

       ("#portfolio-overlay-article-text"
        :position "absolute"
        :top "80%"
        :left "10%"
        :max-width "80%"
        :max-height "20%"
        :margin-left "10px"
        :overflow "auto")

       (".non-portfolio-content-background"
        :position "fixed"
        :bottom "0px"
        :right "0px"
        :z-index "9")

       (".non-portfolio-content"
        :position "absolute"
        :top ,banner-height
        :left "0"
        :padding-top "20px"
        :margin-left "70px"
        :z-index "10")
       ))))
