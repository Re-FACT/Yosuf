.. _developer_coding_convention:

Coding Convention
=================

In genernal, the `Google C++ style <https://www.linkedin.com/pulse/google-c-style-guide-summary-eric-gregori/>`_ is followed when coding in this project.


.. _developer_coding_convention_general:

Generality
----------

Code format is forced as a pre-check to ensure coding convention is applied.
Any pull request which fails code format checking will not be merged.

.. _developer_coding_convention_namespace:

Namespace
---------

.. warning:: Avoid to use the ``std`` namespace in any case!

In general, all the classes and functions should be under a dedicated namespace.

- arkangel

For example

.. code-block::

  namespace arkangel {
    // Functions, variables and classes
  }


.. _developer_coding_convention_class:

Class
-----

For code readability, a class name should contain only digits and alphabets with proper capitalization.

.. warning:: underscore ``_`` is not allowed!


For example

::
  ProjectManager

Any internal data of the class should be private. The name of internal data should contain a tailing undersorce ``_``

For example

::
  std::string name\_;

.. _developer_coding_convention_variable:

Variables
---------

.. warning:: Global variables are not recommended at any time!

For code readability, a variable name should contain digits, alphabets (lower case only) and underscore ``_``.

.. warning:: Upper case ``[A-Z]`` is not allowed!


For example

::
  prj_mgr

.. _developer_coding_convention_function:

Functions
---------

For code readability, a function name should contain digits, alphabets (lower case only) and underscore ``_``.

.. warning:: Upper case ``[A-Z]`` is not allowed!

.. note:: Also applied to any methods in class

.. note:: Please use constant and reference when the input argument is read-only. Use pointers when the input argument will be modified.


For example

::
  void add_user_name(ProjectManager* prj_mgr, const std::string& prj_name);

