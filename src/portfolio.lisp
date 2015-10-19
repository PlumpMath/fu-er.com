(defpackage :fu-er-com.portfolio
  (:use :cl :hunchentoot :cl-who :parenscript))
(in-package :fu-er-com.portfolio)

(defun article (title link img description &optional rank)
  (with-html-output-to-string (*standard-output* nil)
    (:a
      :class "portfolio-article-link"
      :href (str link)
      (:article
        :class "portfolio-article"
        (:img :class "portfolio-article-image"
              :src (str img))
        (:h2 :class "portfolio-article-title" (str title))
        (when rank
          (htm (:h4 :class "portfolio-article-rank" (str rank))))
        (:p (str description))))))

(defun home ()
  (with-html-output-to-string (*standard-output* nil)
    (str (article "Games"
                  "/portfolio?category=games"
                  "/img/portfolio/games/volley/preview.png"
                  "Professional projects."))
    (str (article "Vector"
                  "/portfolio?category=vector"
                  "/img/portfolio/framed-placeholder.png"
                  "UI design and other vectorized pieces."))
    (str (article "Raster"
                  "/portfolio?category=raster"
                  "/img/portfolio/framed-placeholder.png"
                  "Illustrations and personal projects."))
    (str (article "Sketches"
                  "/portfolio?category=sketches"
                  "/img/portfolio/framed-placeholder.png"
                  "Doodles of noodles."))))

(defun games ()
  (with-html-output-to-string (*standard-output* nil)
    (str (article "Volley"
                  "/portfolio?category=games&id=volley"
                  "/img/portfolio/games/volley/preview.png"
                  "A game I made."))
    (str (article "Family Guy : The Quest for Stuff"
                  "/portfolio?category=games&id=family-guy"
                  "/img/portfolio/games/family-guy/preview.png"
                  "A super top hit mega money shot."))
    (str (article "Tiny Monsters"
                  "/portfolio?category=games&id=tiny-monsters"
                  "/img/portfolio/games/tiny-monsters/preview.png"
                  "A cute money grubber."))))

(defun art (category)
  (with-html-output-to-string (*standard-output* nil)
    (:div
      :class "portfolio-overlay"
      (:div
        :class "portfolio-overlay-modal"
        (:article
          :class "portfolio-overlay-article"
          (:img :class "portfolio-overlay-article-image"
                :src "/img/non-portfolio/background.png")
          (:p :class "portfolio-overlay-article-text"
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit."
            ))
        ))))

(define-easy-handler (portfolio :uri "/portfolio") (category)
  (fu-er-com::standard-page
    (or category "Portfolio")
    (with-html-output-to-string (*standard-output* nil)
      (cond
        ((string-equal category "games") (str (games)))
        ((or (string-equal category "vector")
             (string-equal category "raster")
             (string-equal category "sketches"))
           (str (art category)))
        (t (str (home)))
        ))))
