# -*- coding: utf-8 -*-
# distutils: language = c++
# cython: embedsignature = True

from cython.operator cimport dereference as deref
from libcpp.string cimport string
from .cpp cimport amrex as crx
from .utils cimport cli_args
from .utils cimport iostream

from pathlib import Path

cdef extern from "AMReX_ParallelDescriptor.H" namespace "amrex::ParallelDescriptor" nogil:
    int IOProcessorNumber()
    bint IOProcessor()
    int MyProc()
    int NProcs()

cdef extern from "PyAMReXIface.h" namespace "py_amrex" nogil:
     crx.AMReX* init_amrex(int&, char**&, mpi.MPI_Comm, iostream.ostream&)
     void amrex_print(const string&, bint)

cdef class PyAMReX:

    def __cinit__(PyAMReX self, MPI.Comm comm,
                  str inpfile = None,
                  list args = None,
                  str logfile = None,
                  str exe_name = "pyamrex"):
        """
        Args:
            comm: MPI communicator instance
            inpfile: Input file to be parsed during initialization
            args: A list of command line arguments to pass to AMReX
            logfile: If None, redirect to a file with stem from inpfile
        """
        cdef int argc = 0
        cdef char** argv = NULL
        cdef mpi.MPI_Comm comm_obj = comm.ob_mpi
        cdef list pyargs = (
            [exe_name] +
            ([inpfile] if inpfile else []) +
            (args or []))

        cdef cli_args.CLIArgs ccargs = cli_args.CLIArgs(pyargs)
        cdef string logname
        if logfile:
            logname = logfile.encode('UTF-8')
        elif inpfile:
            logname = (str(Path(inpfile).stem) + ".log").encode('UTF-8')

        argc = ccargs.argc()
        argv = ccargs.argv()

        if not logname.empty():
            self.logfile = new iostream.ofstream(logname)
            self.obj = init_amrex(argc, argv, comm_obj, deref(self.logfile))
        else:
            self.logfile = NULL
            self.obj = init_amrex(argc, argv, comm_obj, iostream.cout)

        self.comm = comm
        self.logname = logfile

    def __dealloc__(PyAMReX self):
        if not crx.AMReX.empty():
            crx.Finalize()

        if not self.logfile is NULL:
            del self.logfile

    def print(PyAMReX self, str msg, bint emit_newline = True):
        """Print to the output stream of AMReX"""
        amrex_print(msg, emit_newline)

    @property
    def mpi_rank(PyAMReX self):
        """Return the rank of this process"""
        return MyProc()

    @property
    def mpi_size(PyAMReX self):
        """Return the size of this MPI communicator"""
        return NProcs()

    @property
    def is_io_proc(PyAMReX self):
        """Is this the root MPI processor"""
        return IOProcessor()

    @property
    def io_rank(PyAMReX self):
        """Return the rank of the I/O processor"""
        return IOProcessorNumber()
