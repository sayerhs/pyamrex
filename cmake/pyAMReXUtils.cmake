function(add_amrex_module modname)
  add_cython_target(${modname} CXX)
  add_library(${modname} MODULE ${modname})
  target_compile_features(${modname} PRIVATE cxx_std_14)
  target_compile_options(${modname} PRIVATE
    $<$<CXX_COMPILER_ID:AppleClang,Clang>:-Wno-deprecated-declarations;-Wno-pass-failed;-Wno-c++17-extensions>
    )
  set_target_properties(${modname} PROPERTIES CXX_EXTENSIONS OFF)

  target_include_directories(${modname} SYSTEM PRIVATE
    ${NumPy_INCLUDE_DIR}
    ${MPI_CXX_INCLUDE_PATH}
    )
  target_link_libraries(${modname}
    AMReX::amrex
    ${MPI_CXX_LIBRARIES})
  python_extension_module(${modname})

  file(RELATIVE_PATH mod_install_dir ${PROJECT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR})
  install(TARGETS ${modname} LIBRARY DESTINATION ${mod_install_dir})
endfunction()

function(add_utils_module modname)
  add_cython_target(${modname} CXX)
  add_library(${modname} MODULE ${modname})
  target_compile_features(${modname} PRIVATE cxx_std_14)
  target_compile_options(${modname} PRIVATE
    $<$<CXX_COMPILER_ID:AppleClang,Clang>:-Wno-deprecated-declarations;-Wno-pass-failed;-Wno-c++17-extensions>
    )
  set_target_properties(${modname} PROPERTIES CXX_EXTENSIONS OFF)

  python_extension_module(${modname})

  file(RELATIVE_PATH mod_install_dir ${PROJECT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR})
  install(TARGETS ${modname} LIBRARY DESTINATION ${mod_install_dir})
endfunction()
