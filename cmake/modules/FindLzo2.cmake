# Try to find the lzo2 library
#
# Once done this defines:
#  Lzo2_FOUND - system has liblzo2
#  Lzo2_INCLUDE_DIR - the liblzo2 include directory
#  Lzo2_LIBRARIES - Link these to use liblzo2
#  Lzo2_VERSION - the liblzo2 version, if available

#=============================================================================
# Copyright 2016 Dimitri Bouron <bouron.d@gmail.com>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================

if (Lzo2_INCLUDE_DIR AND Lzo2_LIBRARY)
  # in cache already
  set(Lzo2_FOUND TRUE)
else ()
  find_package(PkgConfig)
  pkg_check_modules(PC_LIBLZO2 QUIET liblzo2)
  find_path(Lzo2_INCLUDE_DIR lzo/lzo1.h
    HINTS
    /usr/include
    /usr/local/include
    )

  find_library(Lzo2_LIBRARY NAMES lzo2
    HINTS
    /usr/lib
    /use/lib64
    /usr/local/lib
    /use/local/lib64
    )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(Lzo2
    REQUIRED_VARS Lzo2_LIBRARY Lzo2_INCLUDE_DIR
    VERSION_VAR Lzo2_VERSION
    )

  mark_as_advanced(
    Lzo2_INCLUDE_DIR Lzo2_LIBRARY
    )
  set(Lzo2_FOUND ${LZO2_FOUND})
endif()

if (Lzo2_FOUND)
  set(Lzo2_LIBRARIES ${Lzo2_LIBRARY})

  add_library(Lzo2 UNKNOWN IMPORTED)
  set_target_properties(Lzo2 PROPERTIES
    IMPORTED_LOCATION ${Lzo2_LIBRARY}
    INTERFACE_INCLUDE_DIRECTORIES ${Lzo2_INCLUDE_DIR}
    )
endif()
