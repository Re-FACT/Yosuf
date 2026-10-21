# ---------------------------------------------------------------------------
# The plugin: a MODULE library with no "lib" prefix -> src.so
# Load with:  yosys -m ./src.so
# Yosys symbols are resolved from the yosys executable at load time.
# ---------------------------------------------------------------------------
add_library(yosys-sofa MODULE
  src/synth_sofa.cc
)

set_target_properties(yosys-sofa PROPERTIES
  PREFIX ""
  CXX_VISIBILITY_PRESET default
)
target_include_directories(yosys-sofa PRIVATE 
  ${YOSYS_CMAKE_SOURCE_DIR}
  ${YOSYS_CMAKE_BINARY_DIR}
)
target_compile_definitions(yosys-sofa PRIVATE 
  _YOSYS_
)
add_dependencies(yosys-sofa ${YOSYS_TARGET})   # build Yosys first

if(APPLE)
  target_link_options(yosys-sofa PRIVATE -undefined dynamic_lookup)
endif()

# Define the list of tech libraries
set(TECH_LIBS "sofa-hd" "qlsofa-hd" "sofa-plus-hd")
# Create the subdir before copy
add_custom_command(
    TARGET yosys-sofa
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory
            "${YOSYS_CMAKE_BINARY_DIR}/share/${YOSUF_SHARE_DIRNAME}"
    COMMENT "Creating ${YOSUF_SHARE_DIRNAME} under Yosys shared directory"
)
# Loop to create three separate custom commands attached to the target
foreach(LIB_NAME ${TECH_LIBS})
    add_custom_command(
        TARGET yosys-sofa
        POST_BUILD
        # This will safely run for each folder; copy_directory auto-creates missing paths
        COMMAND ${CMAKE_COMMAND} -E copy_directory
            "${CMAKE_CURRENT_SOURCE_DIR}/${LIB_NAME}"
            "${YOSYS_CMAKE_BINARY_DIR}/share/${YOSUF_SHARE_DIRNAME}/${LIB_NAME}"
        COMMENT "Copying ${LIB_NAME} to Yosys shared directory"
    )
endforeach()

# ---------------------------------------------------------------------------
# Install (cmake --install build --prefix <dir>)
# ---------------------------------------------------------------------------
include(GNUInstallDirs)
install(TARGETS yosys-sofa
        LIBRARY DESTINATION "${CMAKE_INSTALL_BINDIR}")
# Loop to create three separate custom commands attached to the target
foreach(LIB_NAME ${TECH_LIBS})
  install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${LIB_NAME}
          DESTINATION ${CMAKE_INSTALL_DATADIR}/yosys/${YOSUF_SHARE_DIRNAME}/${LIB_NAME})
endforeach()
