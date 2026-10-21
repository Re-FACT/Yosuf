cmake_minimum_required(VERSION 3.16)
project(yosys_plugin_src VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# ---------------------------------------------------------------------------
# Yosys: git submodule, pulled in with add_subdirectory only.
# The submodule's CMakeLists.txt must define a target named `yosys` (the
# executable); change YOSYS_TARGET if yours is called something else.
# ---------------------------------------------------------------------------
set(YOSYS_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/yosys")
set(YOSYS_TARGET yosys CACHE STRING "Name of the Yosys executable target")

# Options to enable/disable dependencies for yosys
set(YOSYS_WITHOUT_TCL OFF CACHE BOOL "Disable TCL parser integrated in yosys")
set(YOSYS_WITHOUT_ABC OFF CACHE BOOL "Disable ABC support in yosys")
set(YOSYS_SKIP_ABC_SUBMODULE_CHECK OFF CACHE BOOL "Do not allow yosys to checkout submodule during build. It is handled by OpenFPGA")
set(YOSYS_ENABLE_VERIFIC OFF CACHE BOOL "Enable verific library in yosys")
set(YOSYS_ENABLE_COVERAGE OFF CACHE BOOL "Enable coverage test in yosys")
set(YOSYS_ENABLE_PROFILING OFF CACHE BOOL "Enable profiling in compiled yosys")
set(YOSYS_ENABLE_UNIT_TESTS OFF CACHE BOOL "Disable unit tests in compiled yosys")
set(YOSYS_ENABLE_FUNCTIONAL_TESTS OFF CACHE BOOL "Disable functional tests in compiled yosys")
# Yosys inherit ccache setting from parent project
if(CMAKE_CXX_COMPILER_LAUNCHER)
  set(YOSYS_COMPILER_LAUNCHER ${CMAKE_CXX_COMPILER_LAUNCHER} CACHE STRING "Compiler launcher being consistent with parent project")
else()
  set(YOSYS_COMPILER_LAUNCHER ${CCACHE_PROGRAM} CACHE STRING "Compiler launcher being consistent with parent project")
endif()
list(APPEND CMAKE_MODULE_PATH ${YOSYS_SOURCE_DIR}/cmake)
# Now include yosys with the settings above
add_subdirectory(thirdparty/yosys)

if(NOT TARGET ${YOSYS_TARGET})
  message(FATAL_ERROR
    "thirdparty/yosys did not define a target named '${YOSYS_TARGET}'. "
    "Set -DYOSYS_TARGET=<name> to the Yosys executable target.")
endif()

# ---------------------------------------------------------------------------
# All the plugins are under the src directory. including the support for multiple devices
# ---------------------------------------------------------------------------
add_subdirectory(src)
