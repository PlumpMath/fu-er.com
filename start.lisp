(load "fu-er-com.asd")
(ql:quickload :fu-er-com)

(defpackage :fu-er-com.start
  (:use :cl :hunchentoot :cl-who :parenscript))
(in-package :fu-er-com.start)

(defparameter *server* nil)

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

(defun setup-cl-who ()
  (setf (html-mode) :html5)
  ; Allow cl-who and parenscript to work together
  (setf *js-string-delimiter* #\"))

(setup-cl-who)
(start-server)
