(defpackage :fu-er-com.portfolio
  (:use :cl :hunchentoot :cl-who :parenscript))
(in-package :fu-er-com.portfolio)

(define-easy-handler (portfolio :uri "/portfolio") (category)
  (fu-er-com::standard-page
    (or category "Portfolio")
    (with-html-output-to-string (*standard-output* nil)
      (:article
        :class "portfolio-article"
        (:img :class "portfolio-article-image"
              :src "/img/portfolio/framed-placeholder.png")
        (:h2 "Volley")
        (:p "Description about volley"))
      (:article
        :class "portfolio-article"
        (:img :class "portfolio-article-image"
              :src "/img/portfolio/framed-placeholder.png")
        (:h2 "Volley")
        (:p "Description about volley"))
      (:article
        :class "portfolio-article"
        (:img :class "portfolio-article-image"
              :src "/img/portfolio/framed-placeholder.png")
        (:h2 "Volley")
        (:p "Description about volley"))
      (:article
        :class "portfolio-article"
        (:img :class "portfolio-article-image"
              :src "/img/portfolio/framed-placeholder.png")
        (:h2 "Volley")
        (:p "Description about volley"))
      (:article
        :class "portfolio-article"
        (:img :class "portfolio-article-image"
              :src "/img/portfolio/framed-placeholder.png")
        (:h2 "Volley")
        (:p "Description about volley"))
      )))
