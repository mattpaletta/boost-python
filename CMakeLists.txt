cmake_minimum_required(VERSION 3.0)
find_package(PythonLibs 3 REQUIRED)
#To prevent attempts to link to python2 libraries, specify
#the version of libboost_python
#See https://gitlab.kitware.com/cmake/cmake/issues/16391
if(UNIX)
	set(BOOST_PYTHONLIB python-py36)
else()
    set(BOOST_PYTHONLIB python3)
endif()
#find_package(Boost COMPONENTS python3 ${BOOST_PYTHONLIB})
find_package(Boost 1.72 COMPONENTS python)

add_executable(hello hello.cpp)
add_executable(hello-sklearn hello-sklearn.cpp)

target_include_directories(hello PUBLIC ${Boost_INCLUDE_DIRS} ${PYTHON_INCLUDE_DIRS})
target_link_libraries(hello ${Boost_LIBRARIES} ${PYTHON_LIBRARIES})

target_include_directories(hello-sklearn PUBLIC ${Boost_INCLUDE_DIRS} ${PYTHON_INCLUDE_DIRS})
target_link_libraries(hello-sklearn ${Boost_LIBRARIES} ${PYTHON_LIBRARIES})
