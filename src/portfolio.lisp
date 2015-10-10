(defpackage :fu-er-com.portfolio
  (:use :cl :hunchentoot :cl-who :parenscript))
(in-package :fu-er-com.portfolio)

(defun article (title link description &optional rank)
  (with-html-output-to-string (*standard-output* nil)
    (:a
      :class "portfolio-article-link"
      :href (str link)
      (:article
        :class "portfolio-article"
        (:img :class "portfolio-article-image"
              :src "/img/portfolio/framed-placeholder.png")
        (:h2 :class "portfolio-article-title" (str title))
        (when rank
          (htm (:h4 :class "portfolio-article-rank" (str rank))))
        (:p (str description))))
    ))

(define-easy-handler (portfolio :uri "/portfolio") (category)
  (fu-er-com::standard-page
    (or category "Portfolio")
    (with-html-output-to-string (*standard-output* nil)
      (str (article "Volley"
                    "/portfolio?category=games"
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue."
                    "Furthington Studios | Artist, designer, engineer"))
      )))
