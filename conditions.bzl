# Copyright (c) 2019 The Bazel Utils Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

def if_x86_32(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:x86_32": a,
        "//conditions:default": b,
    })

def if_x86_64(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:x86_64": a,
        "//conditions:default": b,
    })

def if_x86(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:x86": a,
        "//conditions:default": b,
    })

def if_ppc(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:ppc": a,
        "//conditions:default": b,
    })

def if_arm(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:arm": a,
        "//conditions:default": b,
    })

def if_aarch64(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:aarch64": a,
        "//conditions:default": b,
    })

def if_s390x(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:s390x": a,
        "//conditions:default": [],
    })

def if_mac(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:mac": a,
        "//conditions:default": b,
    })

def if_ios(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:ios": a,
        "//conditions:default": b,
    })

def if_mac_or_ios(a):
    return select({
        "@com_chokobole_bazel_utils//:mac_or_ios": a,
        "//conditions:default": [],
    })

def if_freebsd(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:freebsd": a,
        "//conditions:default": b,
    })

def if_android(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:android": a,
        "//conditions:default": b,
    })

def if_linux(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:linux": a,
        "//conditions:default": b,
    })

def if_windows(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:windows": a,
        "//conditions:default": b,
    })

def if_posix(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:windows": b,
        "//conditions:default": a,
    })

def if_clang(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:clang": a,
        "//conditions:default": b,
    })

def if_gcc(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:gcc": a,
        "//conditions:default": b,
    })

def if_msvc(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:msvc": a,
        "//conditions:default": b,
    })

def if_clang_cl(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:clang_cl": a,
        "//conditions:default": b,
    })

def if_clang_or_clang_cl(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:clang": a,
        "@com_chokobole_bazel_utils//:clang_cl": a,
        "//conditions:default": b,
    })

def if_asan(a, b = []):
    return select({
        "@com_chokobole_bazel_utils//:asan": a,
        "//conditions:default": b,
    })
