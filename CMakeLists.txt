cmake_minimum_required(VERSION 3.7)
set(PROJECT nugem)
project(${PROJECT})


# Add global definitions
add_definitions("-Wall")
file(GLOB_RECURSE SOURCE_FILES "src/*.cpp")

add_executable(${PROJECT} ${SOURCE_FILES})
# Using C++14
set_property(TARGET ${PROJECT} PROPERTY CXX_STANDARD 14)
set_property(TARGET ${PROJECT} PROPERTY CXX_STANDARD_REQUIRED 14)

message("CMAKE_CXX_COMPILER_ID: ${CMAKE_CXX_COMPILER_ID}
CMAKE_CXX_COMPILER_VERSION: ${CMAKE_CXX_COMPILER_VERSION}")

# gcc 5 and clang 3.4 at least to support c++14
if (CMAKE_CXX_COMPILER_ID MATCHES "Clang" AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 3.4)
    message(FATAL_ERROR "Require at least clang++-3.4")
endif ()
if (CMAKE_CXX_COMPILER_ID MATCHES "GNU" AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 5.1)
    message(FATAL_ERROR "Require at least g++-5.1")
endif ()

# Find SDL2
# https://cmake.org/cmake/help/latest/module/FindPkgConfig.html
INCLUDE(FindPkgConfig REQUIRED)
PKG_CHECK_MODULES(SDL2 REQUIRED sdl2)
PKG_CHECK_MODULES(SDL2_IMAGE REQUIRED SDL2_image)
PKG_CHECK_MODULES(GL REQUIRED gl)
PKG_CHECK_MODULES(GLEW REQUIRED glew)
PKG_CHECK_MODULES(GLM REQUIRED glm)
if (APPLE)
    PKG_CHECK_MODULES(GLU REQUIRED glut)
else ()
    PKG_CHECK_MODULES(GLU REQUIRED glu)
endif ()
find_package(OpenGL REQUIRED)
if(${CMAKE_SYSTEM_NAME}  MATCHES "Linux" OR ${CMAKE_SYSTEM_NAME}  MATCHES  "Windows")
    find_package(GLEW REQUIRED)
endif()

# see what platform we are on and set platform defines
if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    add_definitions(-DGL_SILENCE_DEPRECATION)
    target_link_libraries(${PROJECT} "-framework Metal -framework Foundation")

elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    set ( PROJECT_LINK_LIBS -lGL)
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    add_compile_definitions(_USE_MATH_DEFINES)
    add_compile_definitions(NOMINMAX)
    target_compile_definitions(${PROJECT} PRIVATE /wd4251)
endif()

if (CMAKE_BUILD_TYPE MATCHES Debug)
    add_definitions("-g -O0 -Wall -Wextra -Wpedantic -fsanitize=address")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=address")
endif ()

message("SDL2_INCLUDE_DIRS: ${SDL2_INCLUDE_DIRS}
SDL2_IMAGE_INCLUDE_DIRS: ${SDL2_IMAGE_INCLUDE_DIRS}
GLEW_INCLUDE_DIRS: ${GLEW_INCLUDE_DIRS}
GL_INCLUDE_DIRS:${GL_INCLUDE_DIRS}
GLM_INCLUDE_DIRS: ${GLM_INCLUDE_DIRS}
GLU_INCLUDE_DIRS: ${GLU_INCLUDE_DIRS}")
include_directories(${SDL2_INCLUDE_DIRS} ${SDL2_IMAGE_INCLUDE_DIRS} ${GL_INCLUDE_DIRS} ${GLEW_INCLUDE_DIRS} ${GLM_INCLUDE_DIRS} ${GLU_INCLUDE_DIRS})

message("SDL2_LINK_LIBRARIES: ${SDL2_LINK_LIBRARIES}
SDL2_IMAGE_LINK_LIBRARIES: ${SDL2_IMAGE_LINK_LIBRARIES}
GLEW_LINK_LIBRARIES: ${GLEW_LINK_LIBRARIES}
GL_LINK_LIBRARIES:${GL_LINK_LIBRARIES}
GLM_LINK_LIBRARIES: ${GLM_LINK_LIBRARIES}
GLU_LINK_LIBRARIES: ${GLU_LINK_LIBRARIES}")
target_link_libraries(${PROJECT} ${SDL2_LINK_LIBRARIES} ${SDL2_IMAGE_LINK_LIBRARIES} ${GL_LINK_LIBRARIES} ${GLEW_LINK_LIBRARIES} ${GLM_LINK_LIBRARIES} ${GLU_LINK_LIBRARIES} OpenGL::GL)
install(TARGETS ${PROJECT} DESTINATION bin)


