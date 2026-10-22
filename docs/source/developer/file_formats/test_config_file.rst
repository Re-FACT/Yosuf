.. _file_format_test_config_file:

Test Config File (.yaml)
========================

Test config file contains the common variables to be used when running a number of testcases. 

An example of main task file is shown as follows.

.. literalinclude:: test_config.yaml
  :language: yaml


.. option:: bin_under_test="<string>"

  Path to the Yosys binary executable. Should consider the default root is the home directory of the current project.

.. note:: You need to compile the codebase before running any testcase. See details in :ref:`manual_compile` 

.. option:: task_root="<string>"

  Define the default root directory for testcases. This is used by :ref:`file_format_task_file_main`` when specifying the path to task configuration files. 

.. option:: runtime_dirname="<string>"

  Define the prefix of runtime directory when running each testcase. For each testcase, a runtime directory will be created where temporary files outputted by Yosys are placed. You may find these directories after running regression tests. For example,

.. code-block::

  xifan@xifan-ThinkStation-P358-Tower:~/github/arkangel_frontend/tests/tasks/quick_test$ ls
  benchmark                         _ys_rundir_quick_test_counter8_sync_reset
  config                            _ys_rundir_quick_test_counterdown16_1clk_negedge_async_resetp
  _ys_rundir_quick_test_adder_16    _ys_rundir_quick_test_counterup16_1clk_posedge_async_resetn
  _ys_rundir_quick_test_adder_8     _ys_rundir_quick_test_counterup16_1clk_posedge_async_resetp
  _ys_rundir_quick_test_adder_96    _ys_rundir_quick_test_counterup16_1clk_posedge_sync_resetn
  _ys_rundir_quick_test_and2        _ys_rundir_quick_test_counterupn_1clk_dualedge_async_resetp
  _ys_rundir_quick_test_and2_latch

  Where the directories whose names start with ``_ys_rundir`` are the runtime directories.

.. option:: yosys_template_root="<string>"

  Specify the default root directory which contains yosys template scripts required by testcases. This is used by :ref:`file_format_task_file_sub`` when specifying the path to yosys template file. 


