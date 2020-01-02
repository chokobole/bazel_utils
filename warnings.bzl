# Copyright (c) 2019 The Bazel Utils Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

load("//:conditions.bzl", "if_windows")
load("//:warnings_clang.bzl", "clang_default_warnings")

def default_warnings():
    return if_windows([], [
        "-Wno-narrowing",
    ]) + clang_default_warnings()
