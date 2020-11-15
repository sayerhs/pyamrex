#ifndef PYAMREXIFACE_H
#define PYAMREXIFACE_H

#include "AMReX.H"

#include <string>
#include <memory>
#include <iosfwd>

namespace py_amrex {

amrex::AMReX* init_amrex(int& argc, char**& argv, MPI_Comm comm, std::ostream& out);

void amrex_print(const std::string& msg, bool add_endl);
}

#endif /* PYAMREXIFACE_H */
