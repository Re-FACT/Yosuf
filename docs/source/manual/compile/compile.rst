.. _manual_compile:

How to Compile
--------------

Supported Operating Systems
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Yosuf is continously tested on

- Ubuntu 24.04/26.04
- MacOS 15/26
- Windows 10/11 (Msys2)

It might work with earlier versions and other distributions.

Build Steps
~~~~~~~~~~~
Yosuf uses CMake to generate the Makefile scripts.
In general, please follow the steps to compile

.. code-block:: shell

  git clone 
  cd Yosuf
  make all

.. note:: Requires gcc/g++ version > 13 and clang version > 15.

.. note:: cmake3.13+ is recommended to compile 

.. note:: Recommend using ``make -j<int>`` to accelerate the compilation, where ``<int>`` denotes the number of cores to be used in compilation.

.. _tutorial_compile_build_options:

Build Options
~~~~~~~~~~~~~

General build targets are available in the top-level makefile. Call help desk to see details

.. code-block:: shell

  make help

The following options are available for a custom build

.. option:: BUILD_TYPE=<string>

  Specify the type of build. Can be either ``release`` or ``debug``. By default, release mode is selected (full optimization on runtime)

.. option:: CMAKE_FLAGS=<string>

  Force build flags to CMake. The following flags are available

.. code-block::

  make all BUILD_TYPE=debug CMAKE_FLAGS="-DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache"

.. option:: CMAKE_GOALS=<string>

  Specify the build target for CMake system. For example, ``cmake_goals=yosys-sofa`` indicates that only openfpga binary will be compiled. For a detailed list of targets, use ``make list_cmake_targets`` to show. By default, all the build targets will be included. 

.. _tutorial_compile_dependencies:

Dependencies
~~~~~~~~~~~~

Dependencies can be installed upon the use of ArkAngel on different systems

Ubuntu
^^^^^^

- Dependencies required to build the code base

.. include:: build_dependency_ubuntu.sh
  :code: shell
  
.. note:: Python packages are also required
  
.. code-block::

  python3 -m pip install -r requirements.txt

- Dependencies required to build documentation

.. include:: doc_dependencies.sh
  :code: shell

Windows
^^^^^^^

If your OS is Msys2 in Windows, we offer the script to install all the dependencies

- Dependencies required to build the code base

.. include:: build_dependency_win-msys2-UCRT64.sh
  :code: shell
  
.. note:: Python packages are also required
  
.. code-block::

  python3 -m pip install -r requirements.txt

- Dependencies required to build documentation

.. include:: doc_dependencies.sh
  :code: shell

MacOS
^^^^^

For all the MacOS version supported, we offer the script to install all the dependencie

- Dependencies required to build the code base

.. include:: build_dependency_macos.sh
  :code: shell
  
.. note:: Python packages are also required
  
.. code-block::

  python3 -m pip install -r requirements.txt

- Dependencies required to build documentation

.. include:: doc_dependencies.sh
  :code: shell
