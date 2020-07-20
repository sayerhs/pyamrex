# -*- coding: utf-8 -*-

"""\
pyAMReX - Python wrappers for AMReX
"""

from skbuild import setup

VERSION = "0.0.1"

classifiers = [
    "Development Status :: 3 -Alpha",
    "License :: OSI Approved :: Apache Software License",
    "Operating System :: POSIX",
    "Operating System :: POSIX :: Linux",
    "Operating System :: MacOS :: MacOS X",
    "Operating System :: Microsoft :: Windows",
    "Programming Language :: Python :: 2.7",
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: Implementation :: CPython",
    "Topic :: Scientific/Engineering :: Physics"
    "Topic :: Scientific/Engineering :: Visualization",
    "Topic :: Utilities",
]

setup(
    name="pyAMReX",
    version=VERSION,
    url="https://github.com/sayerhs/pyamrex",
    license="Apache License, Version 2.0",
    description="Python-wrapper for Sierra Toolkit (STK)",
    long_description=__doc__,
    author="Shreyas Ananthan",
    platforms="any",
    classifiers=classifiers,
    include_package_data=True,
    packages=[
        'amrex'
    ],
)
