# ---------------------------------------------------------------------------
# The plugin: a MODULE library with no "lib" prefix -> src.so
# Load with:  yosys -m ./src.so
# Yosys symbols are resolved from the yosys executable at load time.
# ---------------------------------------------------------------------------
add_library(sofa MODULE
  sofa/synth_sofa.cc
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

# ---------------------------------------------------------------------------
# Install (cmake --install build --prefix <dir>)
# ---------------------------------------------------------------------------
include(GNUInstallDirs)
install(TARGETS sofa
        LIBRARY DESTINATION "${CMAKE_INSTALL_BINDIR}")
