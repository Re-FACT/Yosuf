.. _launch_yosuf_shell:

Launch Yosuf Shell
------------------

Yosuf Front-end employs the shell-like interface of Yosys, in order to integrate all the tools in a well-modularized way.
To launch the shell, users can choose two modes ``interactive`` or ``script``.
  
.. warning:: Ensure that you have compiled the codebase by following :ref:`manual_compile`! 

To show the help desk, you may run the following command

.. code-block:: shell

  ./build/thirdparty/yosys/yosys -help

To start with interactive mode, you may run the following command

.. code-block:: shell

  ./build/thirdparty/yosys/yosys

To run in script mode, you may run the following command

.. code-block:: shell

  ./build/thirdparty/yosys/yosys <your_script>.ys


.. _launch_yosuf_shell_plugin:

Load SOFA Plug-in
------------------

Yosuf synthesis recipes can be enabled by loading dedicated plug-in into Yosys.

After launching Yosys, run the following command to load plug-in

.. code-block::

  plugin -i yosys-sofa
  # Alternatively, see how to use the synth command enabled by plug-in
  synth_sofa -help

You may see a help desk shown as following. Note that different version may carry slight difference! Refer to you help desk as final.

.. code-block::

   synth_sofa [options]
   This command runs synthesis for SOFA eFPGAs

    -top <module>
         use the specified module as top module

    -family <family>
        run synthesis for the specified SOFA architecture
        generate the synthesis netlist for the specified family.
        supported values:
        - sofa-hd
        - qlsofa-hd
        - sofa-chd
        - sofa-plus-hd

    -blif <file>
        write the design to the specified BLIF file. Writing of an output file
        is omitted if this parameter is not specified.

    -verilog <file>
        write the design to the specified verilog file. Writing of an output
        file is omitted if this parameter is not specified.

    -no_dsp
        By default use DSP blocks in output netlist.
        do not use DSP blocks to implement multipliers and associated logic

    -no_adder
        By default use adder cells in output netlist.
        Specifying this switch turns it off.
