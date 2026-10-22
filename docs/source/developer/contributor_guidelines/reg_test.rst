.. _developer_reg_test:

Regression Tests
================

Regression tests are used to ensure that ArkAngel is

- functionally correct
- no degradation in *Quality-of-Results* (QoR)

Regression tests are required to pass before merging any code changes.

Run tests
---------

Regression tests can be run through the following command at the root directory of the project 

.. code-block::

  make reg_test

.. note:: To accelerate runtime, you may customize the number of jobs by adding ``NUM_JOBS=<int>`` to make command

Note that QoR checks are enforced when running regression tests. QoR summary can be found in ``reg_test_qor.csv``

Create Golden QoR
-----------------

Golden QoR is the reference to monintor QoR shifts.
When updating synthesis engine, QoR improvements or reasonable degradation may occur.
In such case, upon on approval of managers, golden QoR should be updated thorugh the following command

.. code-block::

  make reg_golden
  git commit -a # Update golden

.. note:: To accelerate runtime, you may customize the number of jobs by adding ``NUM_JOBS=<int>`` to make command


Add a New Testcase
------------------

To add a new test case to regression test, a number of steps should be followed:

- Create your test case under ``tests/tasks``. Please name your testcase in a reasonable ways, so that other developers can identify its usage easily. For example, ``tests/tasks/quick_test`` is to validate the support of post-synthesis projects.
- A test case should include at least the following files

  - A configuration file under ``config/config.yaml``. See details in :ref:`file_format_test_config_file`.
  - Benchmark files as design sources to enable the tests

- Add the testcase to the task list under ``tests/common/reg_tests.yaml``. See details in :ref:`file_format_task_file`.

Debug tests
-----------

If a regression test failed, detailed logs and intermediate files can be found under a ``_ys*`` directory. Here, we take the example of ``tests/tasks/quick_test/_ys_rundir_quick_test_and2`` and show a debugging process

.. code-block:: shell

  cd tests/tasks/quick_test/_ys_rundir_quick_test_and2
  ../../../build/thirdparty/yosys/yosys run.ys

This should reproduce the errors and you can debug
