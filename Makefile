# 
# Top Makefile
# ------------
#
# Top-level makefile to compile the codebase
#
# Following options are available
# 
# .. option:: BUILD_TYPE=<string>
#
#  Pick the type of compilation. Can be either ``release`` or ``debug``. By default, release mode is selected (full optimization on runtime).
#
# .. option:: CMAKE_FLAGS=<string>
#
#  Force compilation flags for CMake to generate Makefiles

BUILD_TYPE ?= release
# Convert to lower case for consistency
BUILD_TYPE := $(shell echo ${BUILD_TYPE} | tr '[:upper:]' '[lower]')
# Trim any _pgo or _strict in the build type name (since it would not match any of CMake's standard build types
CMAKE_BUILD_TYPE := $(shell echo ${BUILD_TYPE} | sed 's/_\?pgo//' | sed 's/_\?strict//')

# Allow users to pass parameters to cmake, without defining build types
# e.g. make CMAKE_FLAGS="-DCMAKE_CXX_COMPILER=g++-9'
override CMAKE_FLAGS := -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -G 'Unix Makefiles' ${CMAKE_FLAGS}

# -s : Suppresss makefile output (e.g. entering/leaving directories)
# --output-sync target : For parallel compilation ensure output for each target is synchronized (make version >= 4.0)
MAKEFLAGS := -s

# Directory to build the codes
SOURCE_DIR :=${PWD}
BUILD_DIR ?= build
CMAKE_GOALS = all
SUBMODULE=

# Find CMake command from system variable, otherwise use a default one
ifeq ($(origin CMAKE_COMMAND),undefined)
CMAKE_COMMAND := cmake
else
CMAKE_COMMAND := ${CMAKE_COMMAND}
endif

# Configure python
PYTHON_EXEC=python3
# Cross-platform Python interpreter selection.
# Checks for a local .venv first to ensure isolated dependencies are used
# regardless of shell PATH ordering or OS differences.
ifneq ("$(wildcard .venv/Scripts/python.exe)","")
  # Windows virtual environment path
  PYTHON_EXEC := .venv/Scripts/python.exe
else ifneq ("$(wildcard .venv/bin/python)","")
  # Linux and macOS virtual environment path
  PYTHON_EXEC := .venv/bin/python
else ifeq ($(OS),Windows_NT)
  # Fallback to system Python on Windows (avoids Microsoft Store python3 stub)
  PYTHON_EXEC := python
else
  # Fallback to standard Python 3 on Linux and macOS
  PYTHON_EXEC := python3
endif

# Define executables
CLANG_FORMAT_EXEC ?= clang-format
XML_FORMAT_EXEC ?= xmllint
PYTHON_FORMAT_EXEC ?= black

VERSION_FILE = VERSION.md
TAGGED_COMMIT_FILE = .TAGGED_COMMIT
VERSION_BUMP_TYPE = minor
FORCE_COMMIT_VERSION_UPDATE = off
INFRA_ROOT = ${PWD}/utils/refact_infra/
YAMLLINTER_EXEC ?= ${INFRA_ROOT}/scripts/yaml_linter.py

# Detect operating system and use proper name
ifeq ($(OS),Windows_NT)
    YOSYS_PLUGIN_POSTFIX = .dll
else
    YOSYS_PLUGIN_POSTFIX = .so
endif

# Quick test options
TMP_QUICK_TEST = _tmp_quick_test

# Reg test switches
REG_TEST_SELECT = all
REG_TEST_DRYRUN = OFF
REG_DRYRUN_FLAG = 
ifeq ($(REG_TEST_DRYRUN),ON)
REG_DRYRUN_FLAG += --dryrun
endif
# Suggest to increase when the machine is slow in disk read/write
REG_TEST_NEW_THREAD_WAIT_TIME=1
REG_CHECK_QOR=ON
CHECK_QOR_FLAGS =
ifeq ($(REG_CHECK_QOR), ON)
CHECK_QOR_FLAGS = --check_qor
endif

REG_PARSE_REPORT_ONLY=OFF
PARSE_REPORT_ONLY_FLAGS =
ifeq ($(REG_PARSE_REPORT_ONLY), ON)
PARSE_REPORT_ONLY_FLAGS = --parse_report_only
endif

REG_TEST_TASK=mosofa_test

REG_TOOL_CONIG=tool_config.yml
ifeq ($(OS),Windows_NT)
  REG_TOOL_CONFIG := win_tool_config.yml
else
  REG_TOOL_CONFIG := linux_tool_config.yml
endif

# Extract the integer from -j<int> or --jobs=<int> in MAKEFLAGS
NUM_JOBS := $(shell echo "$(MAKEFLAGS)" | grep -oE -- '-j[0-9]+|--jobs=[0-9]+' | grep -oE '[0-9]+' | tail -n1)

# If NUM_JOBS is found, pass it to cmake; otherwise, omit it 
# (or let CMake auto-detect available CPU cores)
ifeq ($(NUM_JOBS),)
    NUM_JOBS=2
endif

# Put it first so that "make" without argument is like "make help".
export COMMENT_EXTRACT

# Put it first so that "make" without argument is like "make help".
help:
	@${PYTHON_EXEC} -c "$$COMMENT_EXTRACT"

.PHONY: help

checkout: 
# Checkout all the submodules
	git submodule init ${SUBMODULE}
	git submodule update --init --recursive ${SUBMODULE}

checkout_shallow: 
# Checkout all the submodules
	git submodule init ${SUBMODULE}
	git submodule update --init --depth 1 ${SUBMODULE}

checkout_build:
# Checkout the submodules required to build source codes
	@+${MAKE} checkout SUBMODULE=thirdparty/yosys

checkout_regtest:
# Checkout the submodules required to build source codes
	@+${MAKE} checkout SUBMODULE=etc/benchmarks/ubm
	@+${MAKE} checkout SUBMODULE=test/ezreg

prebuild:
# Run cmake to generate Makefile under the build directory, before compilation
	@mkdir -p ${BUILD_DIR} && \
	echo "${CMAKE_COMMAND} -S ${SOURCE_DIR} -B ${BUILD_DIR} ${CMAKE_FLAGS}" && \
	${CMAKE_COMMAND} -S ${SOURCE_DIR} -B ${BUILD_DIR} ${CMAKE_FLAGS}

compile: prebuild
# Compile the code base. By default, all the targets will be compiled
# Following options are available
# .. option:: CMAKE_GOALS
#
#   Define the target for cmake to compile. for example, ``cmake_goals=openfpga`` indicates that only openfpga binary will be compiled
	echo "Building target(s): ${CMAKE_GOALS}" && \
	echo "${CMAKE_COMMAND} --build ${BUILD_DIR} ${CMAKE_BUILD_CONFIG} --target ${CMAKE_GOALS} ${PARALLEL_FLAG}"
	+${CMAKE_COMMAND} --build ${BUILD_DIR} ${CMAKE_BUILD_CONFIG} --target ${CMAKE_GOALS} ${PARALLEL_FLAG}

list_cmake_targets: prebuild
# Show the targets available to be built, which can be specified through ``CMAKE_GOALS`` when compile
	cd ${BUILD_DIR} && make help && cd -

all: checkout_build
# A shortcut command to run checkout and compile in serial
	@+${MAKE} compile

format-cpp:
# Format all the C/C++ files under this project, excluding submodules
	for f in `find core -iname *.cpp -o -iname *.hpp -o -iname *.c -o -iname *.h`; \
	do \
	${CLANG_FORMAT_EXEC} --style=file -i $${f} || exit 1; \
	done

check-format-cpp:
# Check if all the C/C++ files are in the expected format
	${INFRA_ROOT}/scripts/check-format.sh -cpp

format-yaml:
# Format all the YAML under this project, excluding submodules
	${PYTHON_EXEC} ${YAMLLINTER_EXEC} 'test/common' --fix --no-backup || exit 1; \
	${PYTHON_EXEC} ${YAMLLINTER_EXEC} 'test/tasks' --fix --no-backup || exit 1; \
	${PYTHON_EXEC} ${YAMLLINTER_EXEC} 'test/requirements' --fix --no-backup || exit 1;

check-format-yaml:
# Check if all the YAML files are in the expected format
	${INFRA_ROOT}/scripts/check-format.sh -yaml

format-all: format-cpp format-yaml
# Format all the C/C++ and YAML codes

update_version:
# Update the patch count in the version number
	echo "======== Bump up patch count in the version number ========"; \
	${PYTHON_EXEC} ${INFRA_ROOT}/scripts/version_updater.py --version_file ${VERSION_FILE} --tagged_commit ${TAGGED_COMMIT_FILE} --force_commit ${FORCE_COMMIT_VERSION_UPDATE}	

release_version:
# Update the patch count in the version number
	echo "======== Bump up release in the version number ========"; \
	${PYTHON_EXEC} ${INFRA_ROOT}/scripts/version_updater.py --version_file ${VERSION_FILE} --tagged_commit ${TAGGED_COMMIT_FILE} --release --bump_type ${VERSION_BUMP_TYPE}	

generate_initial_tagged_commit:
# Create the first version of tagged commit file, used for version update
	git rev-list --max-parents=0 --abbrev-commit HEAD > ${TAGGED_COMMIT_FILE}

quick_test: checkout_regtest
# Run a quick smoke test to test build results
	echo "==== Quick test ===="
	currDir=$${PWD} && mkdir -p ${TMP_QUICK_TEST} && cd ${TMP_QUICK_TEST} && \
	$${currDir}/build/thirdparty/yosys/yosys -m $${currDir}/build/thirdparty/yosys/yosys-sofa${YOSYS_PLUGIN_POSTFIX} $${currDir}/test/tmpl/quick_synth.ys && \
	cd $${currDir} || exit 1;

reg_test:
# Run regression tests with pre-installed tools. Use CHECK_QOR=ON to enable qor check. Use REG_TEST_DRYRUN=ON to enable dryrun mode. Use REG_TEST_SELECT=<string> to selectly run testcase. Use REG_TEST_TASK=[mosofa_test] to pick regression tasks
	echo "==== Regression test ===="
	${PYTHON_EXEC} test/ezreg/scripts/run_ezreg_test.py \
	--path_config test/common/path_config.yml \
	--tut_config test/common/${REG_TOOL_CONFIG} \
	--task test/common/${REG_TEST_TASK}.yml ${CHECK_QOR_FLAG} \
	--new_thread_wait_time ${REG_TEST_NEW_THREAD_WAIT_TIME} \
	--task_select ${REG_TEST_SELECT} \
	${REG_DRYRUN_FLAG} \
	--root_dir ${PWD} --j ${NUM_JOBS}

reg_golden:
# Create golden results for regression tests. Use PARSE_REPORT_ONLY=ON to skip tool run and focus on qor extraction. Use REG_TEST_SELECT=<string> to selectly run testcase. Use REG_TEST_TASK=[mosofa_test] to pick regression tasks
	echo "==== Regression test ===="
	${PYTHON_EXEC} test/ezreg/scripts/run_ezreg_test.py \
	--path_config test/common/path_config.yml \
	--tut_config test/common/${REG_TOOL_CONFIG} \
	--task test/common/${REG_TEST_TASK}.yml \
	--create_golden ${PARSE_REPORT_ONLY_FLAGS} \
	--new_thread_wait_time ${REG_TEST_NEW_THREAD_WAIT_TIME} \
	--task_select ${REG_TEST_SELECT} \
	--root_dir ${PWD} --j ${NUM_JOBS}

clean:
# Remove current build results
# One exception is the arkangel gui, where the working directory is the subumodule itself
	rm -rf ${BUILD_DIR}

# Functions to extract comments from Makefiles
define COMMENT_EXTRACT
import re
with open ('Makefile', 'r' ) as f:
    matches = re.finditer('^([a-zA-Z-_]*):.*\n#(.*)', f.read(), flags=re.M)
    for _, match in enumerate(matches, start=1):
        header, content = match[1], match[2]
        print(f"  {header:10} {content}")
endef
