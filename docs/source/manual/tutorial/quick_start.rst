.. _tutorial_quick_start:

Quick Start
===========

This tutorial show you how to run synthesis for a simple design step-by-step.

.. warning:: Ensure that you have compiled the codebase by following :ref:`manual_compile`! 

Create Runtime Directory
------------------------

Yosys may output logs and temporary file during runtime.
It is recommended to create a local directory for Yosys runtime usage.

Refer the following example

.. code-block:: shell

   # Assume your are under your project home directory
   mkdir _ys_test
   cd _ys_test
   # A quick try on yosys binary
   ./build/thirdparty/yosys/yosys -help
   # If the help desk does not show up, please double-check your compilation 

Craft Synthesis Script
----------------------

It is recommended to craft a script when running synthesis.
A synthesis script consists of three parts

- Load plug-in. See details in :ref:`launch_yosuf_shell_plugin`.
- Read design source files, for example, Verilog netlist
- Run synthesis command

The following shows an example of synthesis script.

.. code-block::

  # Load plug-in
  plugin -i yosys-sofa.so
  # Read design sources. You may call the read_verilog if there are multiple design source files
  read_verilog ../benchmark/and2/and2.v
  # Run synthesis
  synth_rf_alkaid -family sofa-hd -blif yosys_out.blif -top and2

.. note:: If you want to try a different benchmark, the top module may be different!

For details about the synthesis command option, see :ref:`launch_yosuf_shell_plugin`.

You may save the the synthesis script under the runtime directory. For example, ``_ys_test/run.ys``

Run Synthesis
-------------

You may run synthesis at the runtime directory

.. code-block::

   # Assume your are under your project home directory
   cd _ys_test
   # A quick try on yosys binary
   ./build/thirdparty/yosys/yosys run.ys

When synthesis is completed without errors, you may find blif netlist under the runtime directory.
