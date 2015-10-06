(defpackage :fu-er-com
  (:use :cl :hunchentoot :cl-who :parenscript)
  (:export :start-server :stop-server))
(in-package :fu-er-com)

(defparameter *server* nil)

(setf (html-mode) :html5)

(defun stop-server ()
  (when *server*
    (stop *server*)
    (setq *server* nil)))

(defun start-server ()
  (stop-server)
  (start (make-instance 'easy-acceptor
                        :address "localhost"
                        :port 8080
                        :document-root #p"www/")))

; Allow cl-who and parenscript to work together
(setf *js-string-delimiter* #\")

(defun sidebar-css (&optional selected)
  (unless selected
    (setq selected "Portfolio"))

  (with-html-output-to-string (*standard-output* nil)
    (htm
      (:div :class "sidebar sidebar-text"
       (:div :class "sidebar-banner"
        (:img :class "sidebar-banner-image"
         :src "/avatar_1.png"))
       (:div :class "sidebar-content"
        (:nav
          (:ul :class "sidebar-nav"
           (dolist (cat '("Portfolio" "About" "Resume" "Links"))
             (cond ((string-equal cat selected)
                    (htm (:li :class "sidebar-nav-selected"
                           (:a
                             :href (concatenate 'string "/"
                                                (string-downcase cat))
                             (str cat)))))
                   (t
                    (htm (:li
                           (:a
                             :href (concatenate 'string "/"
                                                (string-downcase cat))
                           (str cat))))))))))))))

(define-easy-handler (portfolio :uri "/portfolio") ()
  (with-html-output-to-string (*standard-output* nil :prologue t)
    (:html
     (:head
      (:title "Fu-Er's Site")
      (:link :rel "stylesheet" :href "/main.css" :type "text/css"))
     (:body
      (str (sidebar-css))
      (:div :class "content"
            "content" (:br)
            )))))

(define-easy-handler (main-page :uri "/") ()
  (redirect "/portfolio"))

