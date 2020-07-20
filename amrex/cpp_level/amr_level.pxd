# -*- coding: utf-8 -*-
# distutils: language = c++
# cython: embedsignature = True

from libcpp.string cimport string
from libcpp.memory cimport unique_ptr
from ..utils.iostream cimport ostream
from ..cpp cimport amrex as crx
from ..cpp_core.amr_mesh cimport AmrCore

cdef extern from "AMReX_AmrLevel.H" namespace "amrex::AmrLevel" nogil:
    cpdef enum TimeLevel:
        AmrOldTime, AmrHalfTime, AmrNewTime, Amr1QtrTime, Amr3QtrTime, AmrOtherTime

cdef extern from "AMReX_AmrLevel.H" namespace "amrex" nogil:
    cdef cppclass AmrLevel

cdef extern from "AMReX_AMR.H" namespace "amrex" nogil:
    cdef cppclass Amr(AmrCore):
        Amr()
        Amr(const crx.RealBox*, int, const crx.Vector[int]&, int)

        void InitAmr()
        void init(crx.Real, crx.Real)
        void InitializeInit(crx.Real, crx.Real, const crx.BoxArray*,
                            const crx.Vector[int]*)
        void FinalizeInit(crx.Real, crx.Real)

        void setDtLevel(const crx.Vector[crx.Real]&)
        void setDtMin(const crx.Vector[crx.Real]&)
        void setNCycle(const crx.Vector[int]&)
        int subCycle()
        const string& subcyclingMode()

        int level_being_advanced()
        crx.Real cumTime()
        void setCumTime(crx.Real)
        crx.Real startTime()
        void setStartTime(crx.Real)
        crx.Real dtLevel(int)
        const crx.Vector[crx.Real]& dtLevel()
        crx.Real dtMin(int)
        int nCycle(int)
        int levelSteps(int)
        void setLevelSteps(int, int)
        int levelCount(int)
        void setLevelCount(int, int)
        bint RegridOnRestart()
        int regridInt(int)
        int checkInt()
        crx.Real checkPer()
        int plotInt()
        crx.Real plotPer()

        @staticmethod
        void Initialize()

        @staticmethod
        void Finalize()
        AmrLevel& getLevel(int)
        crx.Vector[unique_ptr[AmrLevel]]& getAmrLevels()
        crx.Long cellCount()
        crx.Long cellCount(int)
        int numGrids()
        int numGrids(int)
        int okToContinue()
        void RegridOnly(crx.Real, bint)
        bint okToRegrid(int)

        void coarseTimeStep(crx.Real)
        crx.Real coarseTimeStepDt(crx.Real)
        int stepOfLastPlotFile()
        int stepOfLastSmallPlotFile()
        int stepOfLastCheckPoint()

        void writePlotFile()
        void checkPoint()

cdef extern from "AMReX_AmrLevel.H" namespace "amrex" nogil:
    cdef cppclass AmrLevel:
        void LevelDirectoryNames(const string&, string&, string&)
        void CreateLevelDirectory(const string&)
        void SetLevelDirectoryCreated(bint)

        # TODO: VisMF
        void writePlotFile(const string&, ostream&)
        void writePlotFilePre(const string&, ostream&)
        void writePlotFilePost(const string&, ostream&)

        void checkPoint(const string&, ostream&)
        void checkPointPre(const string&, ostream&)
        void checkPointPost(const string&, ostream&)

