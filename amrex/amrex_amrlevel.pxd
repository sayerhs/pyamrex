# -*- coding: utf-8 -*-
# distutils: language = c++
# cython: embedsignature = True

from .amrex_core cimport AmrCore
from .cpp_level cimport amr_level as clev

cdef class Amr(AmrCore):
    cdef clev.Amr* amr(Amr self)

    @staticmethod
    cdef Amr wrap_instance(clev.Amr* amr, bint owner=*)

cdef class AmrLevel:
    cdef clev.AmrLevel* ptr
    cdef bint owner

    @staticmethod
    cdef AmrLevel wrap_instance(clev.AmrLevel* ptr, bint owner=*)
