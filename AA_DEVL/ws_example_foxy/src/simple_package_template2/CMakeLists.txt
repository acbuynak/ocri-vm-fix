cmake_minimum_required(VERSION 3.5)
project(simple_package_template2)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)

install(DIRECTORY launch config
        DESTINATION share/${PROJECT_NAME}/)

ament_package()
