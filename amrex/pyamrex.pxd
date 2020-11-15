# -*- coding: utf-8 -*-
# distutils: language = c++
# cython: embedsignature = True

from libcpp.string cimport string
from mpi4py cimport libmpi as mpi

cdef extern from "PyAMReXIface.h" namespace "py_amrex" nogil:
    cdef cppclass PyAMReXIface:
        PyAMReXIface(int& argc, char**& argv, mpi.MPI_Comm comm, string logfile)
        bint output_redirected()
        const string& log_file()
        void print(const string&, bint)

cdef class PyAMReX:
    cdef PyAMReXIface* obj
    cdef public str logfile
