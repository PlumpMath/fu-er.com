(defpackage #:fu-er-com-asd
  (:use :cl :asdf))
(in-package :fu-er-com-asd)

(defsystem fu-er-com
    :name "fu-er-com"
    :version "0.1"
    :maintainer "jeaye"
    :author "jeaye"
    :licence "BSD"
    :description "Fu-Er's website"
    :depends-on ("hunchentoot" "cl-who" "parenscript" "cl-css" "smackjack")
    :components ((:file "src/site"
                        :depends-on ("src/style"))
                 (:file "src/style")))
