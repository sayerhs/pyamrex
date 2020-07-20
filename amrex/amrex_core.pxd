# -*- coding: utf-8 -*-
# distutils: language = c++
# cython: embedsignature = True

from .cpp_core.amr_mesh cimport AmrCore as _AmrCore

cdef class AmrCore:
    cdef _AmrCore* ptr
    cdef bint owner

    @staticmethod
    cdef wrap_instance(_AmrCore* ptr, bint owner=*)
