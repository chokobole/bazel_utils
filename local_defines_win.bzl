# Copyright (c) 2019 The Bazel Utils Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

def runtime_library():
    return [
        "_WINDOWS",
        "WIN32",
    ]

def winver():
    return [
        "_WIN32_WINNT=0x0A00",
        "WINVER=0x0A00",
    ]

def unicode():
    return ["_UNICODE", "UNICODE"]

def lean_and_mean():
    return ["WIN32_LEAN_AND_MEAN"]
