
================ WELCOME TO YOUR NEW VIRTUAL MACHINE ================


 1. About the Operating System
 
 	This is a standard desktop installation of Ubuntu 20.04 Focal Fossa.
 	Ubuntu 20.04 		End of Standard Support: April 2025
 				End of Life (EOL): April 2030
 
 
 2. What's already installed?
   
   	The Robot Operating System (ROS)
	- ROS 1 Noetic		EOL: May 2025
	- ROS 2 Foxy 		EOL: May 2023

	Software Development Tools
	- VSCode		IDE / Code Editor
	- Meld			Visual diff and merge tool
	
	- Git			Software version control
	- Gitkraken		GUI client for using Git
	
	Additional Tools useful for ROS Projects
	- Meshlab		Mesh manipulation
	- Qt Designer		Graphical Interface designer


 3. Example ROS Workspace and package
 
	An example ROS 1 workspace has been included at ~/AA_DEVL/ws_example_noetic.
	The `AA_DEVL` folder is not essential and is included for organization only.
	
	Inside the `ws_example_noetic` workspace is a single example package.
	
	This example workspace may be compiled by running these commands...
	$ cd ~/AA_DEVL/ws_example_noetic
	$ source /opt/ros/noetic/setup.bash
	$ catkin build
	
	Next, you need to 'source' your compiled workspace.
	$ source ./devel/setup.bash
	
	Test the example package by running the below command and watching the output stream.
	$ roslaunch simple_package_template myChatter.launch 
	
	You should see something like this...
	[INFO] [1652735654.393393]: hello world 1652735654.393051
	[INFO] [1652735654.396722]: /listenerI heard hello world 1652735654.393051
	[INFO] [1652735654.493376]: hello world 1652735654.4930387
	[INFO] [1652735654.496668]: /listenerI heard hello world 1652735654.4930387


 4. Example ROS 2 Workspace and package
 
 	An example ROS 2 workspace has been included at ~/AA_DEVL/ws_example_foxy.
 	
 	This example workspace may be compiled by running these commands...
 	$ cd ~/AA_DEVL/ws_example_foxy
 	$ source /opt/ros/foxy/setup.bash
 	$ colcon build
 	
	Next, you need to 'source' your compiled workspace.
	$ source ./install/setup.bash
	
	Test the example package by running the below command and watching the output stream.
	$ ros2 launch simple_package_template2 myChatter.launch.xml
	
	You should see something like this...
	[talker-1] [INFO] [1655482936.935118294] [talker]: Publishing: 'Hello World: 1'
	[listener-2] [INFO] [1655482936.935781460] [listener]: I heard: [Hello World: 1]
	[talker-1] [INFO] [1655482937.935106946] [talker]: Publishing: 'Hello World: 2'
	[listener-2] [INFO] [1655482937.935443988] [listener]: I heard: [Hello World: 2]


 5. Attribution
 
 	This virtual machine image was developed by Adam Buynak (github.com/acbuynak) 
 	for the Ohio Cyber Range Institute (OCRI).
 	

