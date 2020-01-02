# Copyright (c) 2019 The Bazel Utils Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

load("//:conditions.bzl", "if_windows")

###############################################################################
# rtti
###############################################################################

def rtti():
    return if_windows([
        "/GR",
    ], [
        "-frtti",
    ])

def no_rtti():
    return if_windows([
        "/GR-",
    ], [
        "-fno-rtti",
    ])

###############################################################################
# exceptions
###############################################################################

# NOTE: Should be combiend wih exceptions_local_defines() in "local_defines.bzl".
def exceptions_copts():
    return if_windows([
        "/EHsc",
    ], [
        "-fexceptions",
    ])

# NOTE: Should be combiend wih no_exceptions_local_defines() in "local_defines.bzl".
def no_exceptions_copts():
    return if_windows([], [
        "-fno-exceptions",
    ])

###############################################################################
# objc
###############################################################################

def enable_arc():
    return ["-fobjc-arc"]

###############################################################################
# cxx version
###############################################################################

def cxx14():
    return if_windows([
        "/std:c++14",
    ], [
        "-std=c++14",
    ])

def cxx17():
    return if_windows([
        "/std:c++17",
    ], [
        "-std=c++17",
    ])
