# Try to find the cap-ng library
#
# Once done this defines:
#  Capng_FOUND - system has libcap-ng
#  Capng_LIBRARIES - Link these to use libcap-ng
#  Capng_VERSION - the libcap-ng version, if available

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

if (Capng_INCLUDE_DIR AND Capng_LIBRARY)
  # in cache already
  set(Capng_FOUND TRUE)
else ()
  find_package(PkgConfig)
  pkg_check_modules(PC_LIBCAP_NG QUIET libcap-ng)

  find_library(Capng_LIBRARY NAMES cap-ng
    HINTS
    /usr/lib
    /use/lib64
    /usr/local/lib
    /use/local/lib64
    )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(Capng
    REQUIRED_VARS Capng_LIBRARY
    VERSION_VAR Capng_VERSION
    )

  mark_as_advanced(
    Capng_INCLUDE_DIR Capng_LIBRARY
    )
  set(Capng_FOUND ${Capng_FOUND})
endif()

if (Capng_FOUND)
  set(Capng_LIBRARIES ${Capng_LIBRARY})

  add_library(Capng UNKNOWN IMPORTED)
  set_target_properties(Capng PROPERTIES
    IMPORTED_LOCATION ${Capng_LIBRARY}
    )
endif()
