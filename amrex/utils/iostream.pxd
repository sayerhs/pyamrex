# -*- coding: utf-8 -*-
# distutils: language = c++
# cython: embedsignature = True

from libcpp.string cimport string

cdef extern from "<iostream>" namespace "std" nogil:
    cdef cppclass ostream:
        pass

    cdef cppclass istream:
        pass

    ostream cout

cdef extern from "<fstream>" namespace "std" nogil:
    cdef cppclass ofstream(ostream):
         ofstream(const string&)
