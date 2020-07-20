# -*- coding: utf-8 -*-
# distutils: language = c++
# cython: embedsignature = True

cdef extern from "<iostream>" namespace "std" nogil:
    cdef cppclass ostream:
        pass

    cdef cppclass istream:
        pass

    ostream cout
