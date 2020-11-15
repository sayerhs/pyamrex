#include "PyAMReXIface.h"
#include "AMReX_ParmParse.H"
#include "AMReX_Print.H"

#include <fstream>

namespace py_amrex {

PyAMReXIface::PyAMReXIface(
    int& argc, char**& argv, MPI_Comm comm, std::string logfile)
    : m_logfile(logfile)
{
    if (!m_logfile.empty()) {
        m_out_handle.reset(new std::ofstream(m_logfile));

        if (m_out_handle->fail())
            throw std::runtime_error("PyAMReX: Error opening file: " +
                                     m_logfile);
    }

    std::ostream& out = (m_out_handle) ? *m_out_handle : std::cout;

    const auto init_func =
        []() {
            amrex::ParmParse pp("amrex");
            if (!pp.contains("throw_exception"))
                pp.add("throw_exception", 1);

            if (!pp.contains("signal_handling"))
                pp.add("signal_handling", 1);
        };

    amrex::Initialize(argc, argv, true, comm, init_func, out);
}

void PyAMReXIface::print(const std::string& msg, bool add_endl) const
{
    amrex::Print() << msg;
    if (add_endl) amrex::Print() << std::endl;
}

} // py_amrex
