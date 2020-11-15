# -*- coding: utf-8 -*-
# distutils: language = c++
# cython: embedsignature = True

from mpi4py cimport MPI
from mpi4py import MPI
from .cpp cimport amrex as crx
from .utils cimport cli_args

from pathlib import Path

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

        self.obj = new PyAMReXIface(argc, argv, comm_obj, logname)
        self.logfile = logfile

    def __dealloc__(PyAMReX self):
        if not crx.AMReX.empty():
            crx.Finalize()

        if self.obj is not NULL:
            del self.obj

    def print(PyAMReX self, str msg, bint emit_newline = True):
        """Print to the output stream of AMReX"""
        self.obj.print(msg, emit_newline)
