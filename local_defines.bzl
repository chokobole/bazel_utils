# Copyright (c) 2019 The Bazel Utils Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

load("//:conditions.bzl", "if_windows")

###############################################################################
# exceptions
###############################################################################

# See exceptions_copts() in "copts.bzl".
def exceptions_local_defines():
    return if_windows([
        "_HAS_EXCEPTIONS=1",
    ])

# See no_exceptions_copts() in "copts.bzl".
def no_exceptions_local_defines():
    return if_windows([
        "_HAS_EXCEPTIONS=0",
    ])
