# Copyright (c) 2019 The Bazel Utils Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

load("//:conditions.bzl", "if_windows")
load("//:warnings.bzl", "default_warnings")

###############################################################################
# warning
###############################################################################
# NOTE: Should be combiend wih safest_code_linkopts() in "linkopts.bzl"
def safest_code_copts():
    return select({
        "@com_chokobole_bazel_utils//:windows": [
            "/W4",
        ],
        "@com_chokobole_bazel_utils//:clang_or_clang_cl": [
            "-Wextra",
        ],
        "//conditions:default": [
            "-Wall",
            "-Werror",
        ],
    }) + default_warnings()

# NOTE: Should be combiend wih safer_code_linkopts() in "linkopts.bzl"
def safer_code_copts():
    return if_windows([
        "/W3",
    ], [
        "-Wall",
        "-Werror",
    ]) + default_warnings()

###############################################################################
# symbol visibility
###############################################################################
def visibility_hidden():
    return if_windows([], ["-fvisibility=hidden"])

###############################################################################
# sanitizers
###############################################################################

# NOTE: Should be combiend wih asan_linkopts() in "linkopts.bzl"
def asan_copts():
    return ["-fsanitize=address"]
