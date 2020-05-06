;; Auto-generated. Do not edit!


(when (boundp 'forces_torques::BodyRequest)
  (if (not (find-package "FORCES_TORQUES"))
    (make-package "FORCES_TORQUES"))
  (shadow 'BodyRequest (find-package "FORCES_TORQUES")))
(unless (find-package "FORCES_TORQUES::BODYREQUEST")
  (make-package "FORCES_TORQUES::BODYREQUEST"))
(unless (find-package "FORCES_TORQUES::BODYREQUESTREQUEST")
  (make-package "FORCES_TORQUES::BODYREQUESTREQUEST"))
(unless (find-package "FORCES_TORQUES::BODYREQUESTRESPONSE")
  (make-package "FORCES_TORQUES::BODYREQUESTRESPONSE"))

(in-package "ROS")





(defclass forces_torques::BodyRequestRequest
  :super ros::object
  :slots (_body_name ))

(defmethod forces_torques::BodyRequestRequest
  (:init
   (&key
    ((:body_name __body_name) "")
    )
   (send-super :init)
   (setq _body_name (string __body_name))
   self)
  (:body_name
   (&optional __body_name)
   (if __body_name (setq _body_name __body_name)) _body_name)
  (:serialization-length
   ()
   (+
    ;; string _body_name
    4 (length _body_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _body_name
       (write-long (length _body_name) s) (princ _body_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _body_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _body_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass forces_torques::BodyRequestResponse
  :super ros::object
  :slots ())

(defmethod forces_torques::BodyRequestResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass forces_torques::BodyRequest
  :super ros::object
  :slots ())

(setf (get forces_torques::BodyRequest :md5sum-) "5eade9afe7f232d78005bd0cafeab755")
(setf (get forces_torques::BodyRequest :datatype-) "forces_torques/BodyRequest")
(setf (get forces_torques::BodyRequest :request) forces_torques::BodyRequestRequest)
(setf (get forces_torques::BodyRequest :response) forces_torques::BodyRequestResponse)

(defmethod forces_torques::BodyRequestRequest
  (:response () (instance forces_torques::BodyRequestResponse :init)))

(setf (get forces_torques::BodyRequestRequest :md5sum-) "5eade9afe7f232d78005bd0cafeab755")
(setf (get forces_torques::BodyRequestRequest :datatype-) "forces_torques/BodyRequestRequest")
(setf (get forces_torques::BodyRequestRequest :definition-)
      "string body_name
---

")

(setf (get forces_torques::BodyRequestResponse :md5sum-) "5eade9afe7f232d78005bd0cafeab755")
(setf (get forces_torques::BodyRequestResponse :datatype-) "forces_torques/BodyRequestResponse")
(setf (get forces_torques::BodyRequestResponse :definition-)
      "string body_name
---

")



(provide :forces_torques/BodyRequest "5eade9afe7f232d78005bd0cafeab755")


