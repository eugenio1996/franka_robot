cmake_minimum_required(VERSION 2.8.3)
project(forces_torques)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED)

# Eigen 3.2 (Wily) only provides EIGEN3_INCLUDE_DIR, not EIGEN3_INCLUDE_DIRS
if(NOT EIGEN3_INCLUDE_DIRS)
  set(EIGEN3_INCLUDE_DIRS ${EIGEN3_INCLUDE_DIR})
endif()

find_package(catkin REQUIRED
  COMPONENTS
    interactive_markers
    moveit_core
    moveit_visual_tools
    moveit_ros_planning
    moveit_ros_planning_interface
    pluginlib
    geometric_shapes
    pcl_ros
    pcl_conversions
    rosbag
    tf2_ros
    tf2_eigen
    tf2_geometry_msgs
    roscpp
    rospy
    std_msgs
    message_generation
)

find_package(Boost REQUIRED system filesystem date_time thread)

add_service_files(
  FILES
  ApplyBodyWrench.srv
  BodyRequest.srv
)

generate_messages(
  DEPENDENCIES
  geometry_msgs
  std_msgs
)

catkin_package(
  LIBRARIES
    interactivity_utils
  INCLUDE_DIRS
    ${THIS_PACKAGE_INCLUDE_DIRS}
  CATKIN_DEPENDS
    moveit_core
    moveit_visual_tools
    moveit_ros_planning_interface
    interactive_markers
  DEPENDS
    EIGEN3
)
