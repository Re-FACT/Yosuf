.. _developer_ci:

Continous Integration
=====================

Motivation
----------

Continous Integration (CI) systems are built to ensure that input and output files of each teams are

- Correct
- Reproducable
- Consistent with other teams

CI system is automatically triggered on 

- Main branch: the master branch of the codebase
- A pull request on main branch

Workflows
---------

Principles
^^^^^^^^^^

Continous Integration system consists a number of workflows, each of which is designed to validate a specific aspect of the codebase.

Workflows can categorized in the following types

.. option:: Build compatibility

  Compile the codebase from scratch, ensure that users/developers can compile successfully with recommended environment.
  More than one compiler and OS may be included, depending on the build compatibility requirements 
  Build options will also be checked, e.g., debug build, sanitized build *etc.*

.. option:: Regression tests 

  Such type of workflow is designed to ensure the compiled binaries are functionally correct. 
  Multiple regression tests will be included, each of which is designed for a specific case:
  
  - ``checkin``: a quick test (takes < 5 minutes) to finish. Provide an instant check to reflect any fundmental bug.
  - ``basic``: a basic test (takes < 20 minutes) to finish. Provide a low coverage but covers mandatory and most commonly user cases. If the runtime increases, basic tests may be separated. For instance, ``basic1``, ``basic2``
  - ``strong``: a strong test (takes < 45 minutes) to finish. Provide a higher coverage which covers some dedicated features required by users. If the runtime increases, strong tests may be separeted. For instance, ``strong1``, ``strong2``.
  - ``nightly``: a nightly test (takes < 8 hours) to finish. Aims to test large benchmarks required by customers/users.  If the runtime increases, strong tests may be separeted. For instance, ``nightly1``, ``nightly2``.

CI Runners
----------

Workflows are executed on two type of runners (computers)

- Github-hosted runners

- Self-hosted runners

Github-Hosted Runners
^^^^^^^^^^^^^^^^^^^^^

All the detect-changes parts of workflow are executed here because they do not require in-house tools

Self-Hosted Runners
^^^^^^^^^^^^^^^^^^^

Nightly workflow are executed here because they require a long runtime and large disk space.

Currently, the self-hosted runners are on the ``eda_us`` workstation
