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
# .. option:: EDITION_TYPE=<string>
#
#  Pick the type of edition. Can be either ``engineering`` or ``production``. By default, production mode is selected (only HDL-to-Bitstream design flow supported).
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
override CMAKE_FLAGS := -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DARKANGEL_EDITION_TYPE=${EDITION_TYPE} -G 'Unix Makefiles' ${CMAKE_FLAGS}

# -s : Suppresss makefile output (e.g. entering/leaving directories)
# --output-sync target : For parallel compilation ensure output for each target is synchronized (make version >= 4.0)
MAKEFLAGS := -s

# Directory to build the codes
SOURCE_DIR :=${PWD}
BUILD_DIR ?= build
CMAKE_GOALS = all
SUBMODULE=
NUM_JOBS = 8

# Find CMake command from system variable, otherwise use a default one
ifeq ($(origin CMAKE_COMMAND),undefined)
CMAKE_COMMAND := cmake
else
CMAKE_COMMAND := ${CMAKE_COMMAND}
endif

# Define executables
PYTHON_EXEC ?= python3
CLANG_FORMAT_EXEC ?= clang-format
XML_FORMAT_EXEC ?= xmllint
PYTHON_FORMAT_EXEC ?= black

VERSION_FILE = VERSION.md
TAGGED_COMMIT_FILE = .TAGGED_COMMIT
VERSION_BUMP_TYPE = minor
FORCE_COMMIT_VERSION_UPDATE = off
INFRA_ROOT = ${PWD}/utils/refact_infra/

# Reg test options
REG_TEST_TYPE = basic
REG_TEST_SELECT = all
REG_TEST_DRYRUN = OFF
REG_TEST_FLAGS = 
ifeq ($(REG_TEST_DRYRUN),ON)
REG_TEST_FLAGS += --dryrun
endif
# Suggest to increase when the machine is slow in disk read/write
REG_TEST_NEW_THREAD_WAIT_TIME=1

# Extract the -j value from MAKEFLAGS if present, otherwise default to empty (CMake will auto-detect)
# This handles formats like '-j 4' or '-j4'
JOBS_FLAGS := $(shell echo "$(MAKEFLAGS)" | grep -oE '\-j[0-9]*' | sed 's/\-j/--parallel /')

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
	echo "${CMAKE_COMMAND} --build ${BUILD_DIR} ${CMAKE_BUILD_CONFIG} --target ${CMAKE_GOALS} ${JOB_FLAGS}" && \
	${CMAKE_COMMAND} --build ${BUILD_DIR} ${CMAKE_BUILD_CONFIG} --target ${CMAKE_GOALS} ${JOB_FLAGS}

list_cmake_targets: prebuild
# Show the targets available to be built, which can be specified through ``CMAKE_GOALS`` when compile
	cd ${BUILD_DIR} && make help && cd -

all: checkout_build
# A shortcut command to run checkout and compile in serial
	@+${MAKE} compile

format-cpp:
# Format all the C/C++ files under this project, excluding submodules
	for f in `find libs/lib* core -iname *.cpp -o -iname *.hpp -o -iname *.c -o -iname *.h`; \
	do \
	${CLANG_FORMAT_EXEC} --style=file -i $${f} || exit 1; \
	done

check-format-cpp:
# Check if all the C/C++ files are in the expected format
	${INFRA_ROOT}/scripts/check-format.sh -cpp

format-xml:
# Format all the XML files under this project, excluding submodules
	for f in `find etc/device/*/arch etc/device/*/flow_conf etc/device/*/craft_files etc/device/*/openfpga_settings libs/lib*/example -iname *.xml`; \
	do \
	XMLLINT_INDENT="  " && ${XML_FORMAT_EXEC} --format $${f} --output $${f} || exit 1; \
	done

check-format-xml:
# Check if all the XML files are in the expected format
	${INFRA_ROOT}/scripts/check-format.sh -xml

format-py:
# Format all the python scripts under this project, excluding submodules
	for f in `find test/scripts etc/utils/pin_table_gen etc/utils/bus_group_gen etc/utils/netlist_makeup -iname *.py`; \
	do \
	${PYTHON_FORMAT_EXEC} $${f} --line-length 100 || exit 1; \
	done

check-format-py:
# Check if all the python files are in the expected format
	${INFRA_ROOT}/scripts/check-format.sh -py

format-yaml:
# Format all the YAML under this project, excluding submodules
	${PYTHON_EXEC} ${YAMLLINTER_EXEC} 'etc/device/*/arch' --fix --no-backup || exit 1; \

check-format-yaml:
# Check if all the YAML files are in the expected format
	${INFRA_ROOT}/scripts/check-format.sh -yaml

format-all: format-cpp format-xml format-py format-yaml
# Format all the C/C++, XML and Python codes

clean:
# Remove current build results
# One exception is the arkangel gui, where the working directory is the subumodule itself
	rm -rf ${BUILD_DIR}
	rm -rf projects

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

# Functions to extract comments from Makefiles
define COMMENT_EXTRACT
import re
with open ('Makefile', 'r' ) as f:
    matches = re.finditer('^([a-zA-Z-_]*):.*\n#(.*)', f.read(), flags=re.M)
    for _, match in enumerate(matches, start=1):
        header, content = match[1], match[2]
        print(f"  {header:10} {content}")
endef
