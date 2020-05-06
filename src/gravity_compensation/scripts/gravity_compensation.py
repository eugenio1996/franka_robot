#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import Float64MultiArray
import PyKDL as kdl
from urdf_parser_py.urdf import URDF
from pykdl_utils.kdl_parser import kdl_tree_from_urdf_model
from sensor_msgs.msg import JointState

def gravity_compensation_publisher(data): 
    try: old
    except NameError: old = 0
    if old <> data.position[1]:
        print 123
    pub = rospy.Publisher('/panda_arm_controller/command', Float64MultiArray, queue_size=10)
    data_to_send = Float64MultiArray()
    robot = URDF.from_parameter_server()
    tree = kdl_tree_from_urdf_model(robot)
    chain = tree.getChain("panda_link0", "panda_link7")
    grav_vector = kdl.Vector(0, 0, -9.81)  # relative to kdl chain base link
    dyn_kdl = kdl.ChainDynParam(chain, grav_vector)
    jt_positions = kdl.JntArray(7)
    jt_positions[0] = data.position[2]
    jt_positions[1] = data.position[3]        
    jt_positions[2] = data.position[4]
    jt_positions[3] = data.position[5]
    jt_positions[4] = data.position[6]
    jt_positions[5] = data.position[7]
    jt_positions[6] = data.position[8]
    old = data.position[1]

    grav_matrix = kdl.JntArray(7)
    dyn_kdl.JntToGravity(jt_positions, grav_matrix)

    data_to_send.data = [grav_matrix[i] for i in range(grav_matrix.rows())]
    pub.publish(data_to_send)

def gravity_compensation_subscriber():
    rospy.Subscriber("/joint_states", JointState, gravity_compensation_publisher)
    rospy.spin()

if __name__ == '__main__':
    rospy.init_node('gravity_compensation', anonymous=True)
    try:
        gravity_compensation_subscriber()
    except rospy.ROSInterruptException:
        pass
