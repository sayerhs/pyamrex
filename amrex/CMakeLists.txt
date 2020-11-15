add_subdirectory(utils)

add_amrex_module(amrex_base)
add_amrex_module(amrex_core)
add_amrex_module(amrex_amrlevel)
add_amrex_module(pyamrex)

target_sources(pyamrex PRIVATE
  PyAMReXIface.cpp)
target_include_directories(pyamrex PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR})
