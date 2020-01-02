# Copyright (c) 2019 The Bazel Utils Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

load("//:conditions.bzl", "if_windows")

# NOTE: Should be combiend wih safest_code_copts() in "copts.bzl"
def safest_code_linkopts():
    return if_windows([], [
        "-Werror",
    ])

# NOTE: Should be combiend wih safest_code_copts() in "copts.bzl"
def safer_code_linkopts():
    return if_windows([], [
        "-Werror",
    ])

###############################################################################
# sanitizers
###############################################################################

# NOTE: Should be combiend wih asan_copts() in "copts.bzl"
def asan_linkopts():
    return ["-fsanitize=address"]
