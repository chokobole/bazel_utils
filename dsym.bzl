# Copyright (c) 2019 The Bazel Utils Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# This function is taken from
# LICENSE: BSD
# URL: https://github.com/RobotLocomotion/drake/blob/47987499486349ba47ece6f30519aaf8f868bbe9/tools/skylark/drake_cc.bzl
# Modificiation:
# - Modify comment: linux -> elsewhere
def dsym_command(name):
    """Returns the command to produce .dSYM on macOS, or a no-op on elsewhere."""
    return select({
        "@com_chokobole_bazel_utils//:apple_debug": (
            "dsymutil -f $(location :" + name + ") -o $@ 2> /dev/null"
        ),
        "//conditions:default": (
            "touch $@"
        ),
    })

def dsym(
        name,
        tags = ["dsym"],
        visibility = ["//visibility:private"],
        **kwargs):
    native.genrule(
        name = name + "_dsym",
        srcs = [":" + name],
        outs = [name + ".dSYM"],
        output_to_bindir = 1,
        tags = tags,
        visibility = visibility,
        cmd = dsym_command(name),
        **kwargs
    )
