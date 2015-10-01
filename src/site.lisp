(defpackage :fu-er-com
  (:use :cl :hunchentoot :cl-who :parenscript)
  (:export :start-server :stop-server))
(in-package :fu-er-com)

(defparameter *server* nil)

(defun stop-server ()
  (when *server*
    (stop *server*)
    (setq *server* nil)))

(defun start-server ()
  (stop-server)
  (start (make-instance 'easy-acceptor :address "localhost" :port 8080)))

; Allow cl-who and parenscript to work together
(setf *js-string-delimiter* #\")

(define-easy-handler (main-page :uri "/") ()
  (with-html-output-to-string (*standard-output* nil :prologue t)
    (:html
     (:head
      (:title "Fu-Er's Site")
      (:link :rel "stylesheet" :href "/main.css" :type "text/css"))
     (:body
      (:div :class "sidebar"
            (:div :class "sidebar-banner" "sidebar-banner")
            (:div :class "sidebar-content"
                  (:nav
                   (:ul :style "list-style-type: none;"
                    (:li "Portfolio")
                    (:li "About")
                    (:li "Resume")
                    (:li "Links")
                    ))))
      (:div :class "content"
            "content" (:br)
            )))))

