#include <moveit/move_group_interface/move_group_interface.h>

int main(int argc, char** argv)
{
  ros::init(argc, argv, "moving_interface");
  ros::AsyncSpinner spinner(1);
  spinner.start();

  static const std::string PLANNING_GROUP = "panda_arm";

  moveit::planning_interface::MoveGroupInterface move_group(PLANNING_GROUP);

  ROS_INFO_NAMED("moving_interface", "Reference frame: %s", move_group.getPlanningFrame().c_str());
  ROS_INFO_NAMED("moving_interface", "End effector link: %s", move_group.getEndEffectorLink().c_str());

  geometry_msgs::Pose target_pose1;
  target_pose1.orientation.w = 1.0;
  target_pose1.position.x = 0.28;
  target_pose1.position.y = -0.2;
  target_pose1.position.z = 0.5;
  move_group.setPoseTarget(target_pose1);

  move_group.move();

  ros::shutdown();
  return 0;
 }
