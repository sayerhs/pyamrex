pyAMReX -- Python bindings for AMReX
=================================================================

.. only:: html

   :Version: |version|
   :Date: |today|

`pyAMReX <https://github.com/sayerhs/pyamrex>`_ provides python bindings for the
`AMReX <https://github.com/AMReX-Codes/amrex.git>`_. The primary use-case for
this library is to use it within the `ExaWind Simulation Environment
<https://github.com/exawind>`_. The python bindings can be used on Linux or
MacOS operating systems, and require Python v3.6 or later.

.. _installation:

Installation
-------------------

**Runtime dependencies**

- `AMReX <https://github.com/AMReX-Codes/amrex.git>`_
- `Python v3.5 or higher <https://www.python.org/>`_
- `NumPy <https://numpy.org>`_

**Build time dependencies**

In addition to the runtime dependencies you will need the following packages
installed on your system to build pyAMReX from source

- `Cython <https://cython.org>`_
- `scikit-build <https://github.com/scikit-build/scikit-build>`_
- `CMake v3.15 or higher <https://cmake.org>`_

Optionally,  you'll also need the following for development and generating
documentation on your own machine

- `pytest <https://docs.pytest.org/en/latest>`_ for running unit tests
- `Sphinx <https://sphinx-doc.org>`_ for generating this documentation

Building from source
~~~~~~~~~~~~~~~~~~~~~

To build from source create a new Python environment (either *virtualenv* or
*conda env*). You can use the :file:`requirements.txt` in the root directory to
install dependencies via :program:`pip`. Once this step is complete, please
execute the following commands to configure and build the python modules

.. code-block:: bash

   # Clone the git repo
   git clone git@github.com:sayerhs/pyamrex.git
   cd pyamrex

   # Install dependencies
   pip install -r requirements.txt

   # Build extensions
   python setup.py install

Building a development version
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you are developing pyAMReX you should install the package in *development mode*
using the following commands instead of `setup.py install`

.. code-block:: bash

   # Build extensions
   python setup.py build_ext --inplace

   # Install package in develoment mode
   pip install -e .

Once the package is installed in *editable mode* or (*development mode*), you
can execute the ``build_ext`` command after editing the Cython files and have the
latest version of the compiled extensions available within your environment.

Common build issues
~~~~~~~~~~~~~~~~~~~

If you are using `Anaconda Python <https://www.anaconda.com/>`_ (or Conda),
please make sure that you install `mpi4py
<https://mpi4py.readthedocs.io/en/stable/>`_ via source and that the MPI you
used to build these packages are consistent with the ones used to build AMReX.
Incompatibilities amongst MPI libraries used to build AMReX can cause spurious
memory errors and error messages.

pyAMReX API Reference
----------------------

AMReX base
~~~~~~~~~~~~~~~~~~

.. automodule:: amrex.amrex_base
   :members:

AMReX AmrCore bindings
~~~~~~~~~~~~~~~~~~~~~~~

.. automodule:: amrex.amrex_core
   :members:

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
