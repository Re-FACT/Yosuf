# ---------------------------------------------------------------------------
# The plugin: a MODULE library with no "lib" prefix -> src.so
# Load with:  yosys -m ./src.so
# Yosys symbols are resolved from the yosys executable at load time.
# ---------------------------------------------------------------------------
add_library(yosys-sofa MODULE
  synth_sofa.cc
)

set_target_properties(sofa PROPERTIES
  PREFIX ""
  CXX_VISIBILITY_PRESET default
)
target_include_directories(sofa PRIVATE "${YOSYS_SOURCE_DIR}")
add_dependencies(sofa ${YOSYS_TARGET})   # build Yosys first

if(APPLE)
  target_link_options(sofa PRIVATE -undefined dynamic_lookup)
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
install(TARGETS sofa
        LIBRARY DESTINATION "${CMAKE_INSTALL_BINDIR}")
