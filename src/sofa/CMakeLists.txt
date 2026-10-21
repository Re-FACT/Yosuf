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

# Copy the tech libs to yosys share directory
add_custom_command(TARGET yosys-sofa POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${CMAKE_CURRENT_SOURCE_DIR}/sofa-hd"        # Source directory
        "${YOSYS_CMAKE_BINARY_DIR}/share/"           # Destination directory (next to the built binary)
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${CMAKE_CURRENT_SOURCE_DIR}/qlsofa-hd"        # Source directory
        "${YOSYS_CMAKE_BINARY_DIR}/share/"           # Destination directory (next to the built binary)
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${CMAKE_CURRENT_SOURCE_DIR}/sofa-plus-hd"        # Source directory
        "${YOSYS_CMAKE_BINARY_DIR}/share/"           # Destination directory (next to the built binary)
    COMMENT "Copying SOFA tech libs to Yosys shared directory"
)

# ---------------------------------------------------------------------------
# Install (cmake --install build --prefix <dir>)
# ---------------------------------------------------------------------------
include(GNUInstallDirs)
install(TARGETS yosys-sofa
        LIBRARY DESTINATION "${CMAKE_INSTALL_BINDIR}")
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/sofa-hd
        DESTINATION "${CMAKE_INSTALL_DATADIR}")
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/qlsofa-hd
        DESTINATION "${CMAKE_INSTALL_DATADIR}")
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/sofa-plus-hd
        DESTINATION "${CMAKE_INSTALL_DATADIR}")
