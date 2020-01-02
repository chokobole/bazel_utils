# Copyright (c) 2019 The Bazel Utils Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# This functions is taken from
# LICENSE: BSD-3-Clause
# URL: https://github.com/protocolbuffers/protobuf/blob/664f9277b52dd7a68fa4769dc1df4ea9e061267a/compiler_config_setting.bzl
"""Creates config_setting that allows selecting based on 'compiler' value."""

def create_compiler_config_setting(name, value):
    # The "do_not_use_tools_cpp_compiler_present" attribute exists to
    # distinguish between older versions of Bazel that do not support
    # "@bazel_tools//tools/cpp:compiler" flag_value, and newer ones that do.
    # In the future, the only way to select on the compiler will be through
    # flag_values{"@bazel_tools//tools/cpp:compiler"} and the else branch can
    # be removed.
    if hasattr(cc_common, "do_not_use_tools_cpp_compiler_present"):
        native.config_setting(
            name = name,
            flag_values = {
                "@bazel_tools//tools/cpp:compiler": value,
            },
        )
    else:
        native.config_setting(
            name = name,
            values = {"compiler": value},
        )
