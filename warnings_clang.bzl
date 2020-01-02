# Copyright (c) 2019 The Bazel Utils Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

load("//:conditions.bzl", "if_clang_or_clang_cl")

# TODO: Needs explanation
def clang_default_warnings():
    return if_clang_or_clang_cl([
        "-Wthread-safety",
        "-Wimplicit-fallthrough",
    ])
