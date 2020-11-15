#ifndef PYAMREXIFACE_H
#define PYAMREXIFACE_H

#include "AMReX.H"

#include <string>
#include <memory>
#include <iosfwd>

namespace py_amrex {

class PyAMReXIface
{
public:
    PyAMReXIface(int& argc, char**& argv, MPI_Comm comm,
                 std::string logfile = "");

    ~PyAMReXIface() = default;

    bool output_redirected() const { return static_cast<bool>(m_out_handle); }

    const std::string& log_file() const { return m_logfile; }

    void print(const std::string& msg, bool add_endl = true) const;

private:
    const std::string m_logfile;

    std::unique_ptr<std::ostream> m_out_handle;
};

}

#endif /* PYAMREXIFACE_H */
