#include "PyAMReXIface.h"
#include "AMReX_ParmParse.H"
#include "AMReX_Print.H"

#include <fstream>

namespace py_amrex {

amrex::AMReX* init_amrex(int& argc, char**& argv, MPI_Comm comm, std::ostream& out)
{
    const auto init_func =
        []() {
            amrex::ParmParse pp("amrex");
            if (!pp.contains("throw_exception"))
                pp.add("throw_exception", 1);

            if (!pp.contains("signal_handling"))
                pp.add("signal_handling", 1);
        };

    return amrex::Initialize(argc, argv, true, comm, init_func, out);
}

void amrex_print(const std::string& msg, bool add_endl)
{
    amrex::Print() << msg;
    if (add_endl) amrex::Print() << std::endl;
}

} // py_amrex
