cmake_minimum_required(VERSION 3.14)

project(pyAMReX CXX C)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
include(${PROJECT_SOURCE_DIR}/cmake/pyAMReXUtils.cmake)

find_package(PythonExtensions REQUIRED)
find_package(Cython REQUIRED)
find_package(NumPy REQUIRED)
find_package(MPI4Py REQUIRED)
find_package(MPI REQUIRED)
find_package(AMReX REQUIRED)

set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
set(CMAKE_SKIP_BUILD_RPATH FALSE)
set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)

add_subdirectory(amrex)
