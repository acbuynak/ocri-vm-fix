#!/usr/bin/env bash

## OCRI ROS VM fix
# (c) Adam Buynak 2022
# 
# Updates VM Image, Installs packages missing for ROS2
# and adds ROS2 example package
#
# Install with this one-line commands (on Linux):
#
# curl -sSL https:/go.osu.edu/ros-vm-fix | bash
#


install_fixes() {

	apt install -y python3-colcon-common-extensions python3-argcomplete
	apt install -y ros-foxy-ros1-bridge ros-foxy-xacro

	# MoveIt
	apt install -y ros-foxy-moveit

	# Perception Packages
	apt install -y ros-foxy-image-publisher
	apt install -y ros-foxy-realsense2-camera
	apt install -y ros-foxy-realsense2-description

	# ROS Industrial packages
	apt install -y ros-foxy-ros-industrial-cmake-boilerplate
	apt install -y ros-foxy-ros2-control
	apt install -y ros-foxy-ros2-controllers
	apt install -y ros-foxy-joint-state-publisher
	apt install -y ros-foxy-joint-state-publisher-gui
	apt install -y ros-foxy-joint-state-controller
	apt install -y ros-foxy-position-controllers

	# Dependencies needed for building/managing ROS packages
	apt install -y python3-rosdep
	apt install -y python3-catkin-tools
	apt install -y python3-osrf-pycommon
	apt install -y python3-wstool
	apt install -y python3-vcstool
	apt install -y build-essential

}


install_ros_ignition() {

	# Install Ignition
	apt install -y ignition-fortress
	apt install -y ros-noetic-ros-ign
	apt install -y ros-foxy-ros-ign
}


add_ros2_example_package() {

	cd ~

	# Download Package from github:acbuynak
	wget --no-check-certificate --content-disposition https://github.com/acbuynak/ocri-vm-fix/archive/main.zip
	
	# Ensure unzip installed
	apt install unzip
	
	# Decompress
	unzip -po ocri-vm-fix-main.zip
	
	# Wipe old folder & replace with new examples folder
	rm -rf ~/AA_DEVL
	mv ocri-vm-fix-main/AA_DEVL ~/
	
	# Wipe old welcome message & replace
	rm -f ~/Desktop/'README ON FIRST-LOGIN.txt'
	mv ocri-vm-fix-main/'README ON FIRST-LOGIN.txt' ~/Desktop/
}



main() {

	# Switch to Home Folder
	cd ~

	# If the user's id is zero,
	if [[ "${EUID}" -eq 0 ]]; then
		# they are root and all is good
		printf "  %b %s\\n" "${TICK}" "${str}"
		# Show the AIMS Lab logo so they know its the right file.
        	show_ascii_aims    
	else
        	# Otherwise, they do not have enough privileges, so let the user know
		printf "      Script called with non-root privileges.\\n"
		printf "      This VM fix requires elevated privileges to install and run\\n"
		printf "      Performing a Sudo utility check \\n"
		
		# Attempt again and call for user.
		printf "\n\n      Restarting command launch with root privileges.\\n"
		printf "      You may be prompted to enter your password.\\n"
		exec curl -sSL https://raw.githubusercontent.com/acbuynak/ocri-vm-fix/main/runner.sh | sudo bash

		exit
	fi

	# 
	printf "\n\n Updating APT Packages \n"
	apt-get update
	apt-get upgrade -y
    
    
    
	# Apply Fix
	printf "\n\n Applying Fixes & Installing Additional ROS Packages" 
	install_fixes
	
	# Install Simulation Environment (ROS Ignition/Gazebo)
	printf "\n\n Installing ROS Physics Simulation Environment"
	install_ros_ignition
	
	# Example Packages
	printf "\n\n Updating ROS2 Example Package"
	add_ros2_example_package
	
	# Update ROS
	# printf "\n\n Updating ROS distro mirrors"
	# rosdep update
	
	# Final APT Cleanup
	apt autoremove -y
	
	# Report Done
	printf "\n\n DONE! You're reading to learn ROS!"
}


# A simple function that just echoes the AIMS logo in ASCII format
# This lets users know that it is an AIMS Lab product
show_ascii_aims() {
    echo -e "
****************************************************************************
*                   _    ___ __  __ ____    _          _                   *
*                  / \  |_ _|  \/  / ___|  | |    __ _| |__                *
*                 / _ \  | || |\/| \___ \  | |   / _' | '_ \               *
*                / ___ \ | || |  | |___) | | |__| (_| | |_) |              *
*               /_/   \_\___|_|  |_|____/  |_____\__,_|_.__/               *
*                                                                          *
****************************************************************************
***                           OCRI VM FIX                                ***
****************************************************************************
"
}


# Run Script
main "$@"

#EOF
