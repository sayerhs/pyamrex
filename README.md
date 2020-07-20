# pyAMReX -- Python wrappers for AMReX library
![Docs](https://github.com/sayerhs/pyamrex/workflows/Docs/badge.svg)

pyAMReX is a python package that contains bindings for the AMReX C++ library.
The bindings are written in Cython. Please consult
[documentation](https://sayerhs.github.io/pyamrex).

## Requirements

To build and use pyAMReX on your system, you'll need the following dependencies
installed on your system.

- [AMReX](https://github.com/AMReX-Codes/amrex.git) library
- Python (`>3.6`)
- [NumPy](https://numpy.org)
- [mpi4py](https://mpi4py.readthedocs.io)

### Build/development dependencies

To build from source, or for developing pySTK the following additional packages
are necessary:

- [Cython](https://cython.org/) (`>0.25.1`)
- [scikit-build](https://github.com/scikit-build/scikit-build)

Optional dependencies

- [pytest](https://docs.pytest.org/en/latest/index.html) - for testing
- [Sphinx](https://www.sphinx-doc.org/en/master/) - for building documentation

# License

BSD 3-clause license
