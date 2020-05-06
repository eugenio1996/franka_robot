
(cl:in-package :asdf)

(defsystem "forces_torques-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ApplyBodyWrench" :depends-on ("_package_ApplyBodyWrench"))
    (:file "_package_ApplyBodyWrench" :depends-on ("_package"))
  ))