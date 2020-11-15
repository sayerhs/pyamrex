# -*- coding: utf-8 -*-
# distutils: language = c++
# cython: embedsignature = True

from libcpp.string cimport string
from mpi4py cimport MPI
from mpi4py import MPI
from mpi4py cimport libmpi as mpi
from .cpp cimport amrex as crx
from .utils cimport iostream

cdef class PyAMReX:
    cdef crx.AMReX* obj
    cdef iostream.ofstream* logfile
    cdef readonly MPI.Comm comm
    cdef readonly str logname
