# -*- coding: utf-8 -*-
# distutils: language = c++
# cython: embedsignature = True

from cython.operator cimport dereference as deref
from libcpp.memory cimport unique_ptr
from libcpp.cast cimport dynamic_cast
from .cpp cimport amrex as crx

ctypedef clev.Amr* _CppAmrPtr

cdef class Amr(AmrCore):

    cdef clev.Amr* amr(Amr self):
        return dynamic_cast[_CppAmrPtr](self.ptr)

    @staticmethod
    def new():
        """Create a new Amr instance"""
        cdef Amr self = Amr.__new__(Amr)
        self.ptr = new clev.Amr()
        self.owner = True
        return self

    def init(Amr self, double start, double stop):
        """
        Args:
            start: Start time
            stop: Stop time
        """
        self.amr().init(start, stop)

    def get_level(Amr self, int lev):
        return AmrLevel.wrap_instance(&self.amr().getLevel(lev))

    @property
    def amr_levels(Amr self):
        cdef crx.Vector[unique_ptr[clev.AmrLevel]]* lvec = &self.amr().getAmrLevels()
        return [AmrLevel.wrap_instance(deref(lvec)[i].get())
                for i in range(lvec.size())]

    @property
    def cumulative_time(Amr self):
        return self.amr().cumTime()


cdef class AmrLevel:

    def __cinit__(AmrLevel self):
        self.ptr = NULL
        self.owner = False

    def __dealloc__(AmrLevel self):
        if self.ptr is not NULL and self.owner is True:
            del self.ptr

    @staticmethod
    cdef AmrLevel wrap_instance(clev.AmrLevel* ptr_in, bint owner=False):
        cdef AmrLevel self = AmrLevel.__new__(AmrLevel)
        self.ptr = ptr_in
        self.owner = owner
        return self
