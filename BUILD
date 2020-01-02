load("//:compiler_config_setting.bzl", "create_compiler_config_setting")
load("@com_github_bazelbuild_buildtools//buildifier:def.bzl", "buildifier")

config_setting(
    name = "x86_32",
    constraint_values = ["@bazel_tools//platforms:x86_32"],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "x86_64",
    constraint_values = ["@bazel_tools//platforms:x86_64"],
    visibility = ["//visibility:public"],
)

alias(
    name = "x86",
    actual = select({
        ":x86_32": "x86_32",
        ":x86_64": "x86_64",
        "//conditions:default": ":x86_32",
    }),
    visibility = ["//visibility:public"],
)

config_setting(
    name = "ppc",
    constraint_values = ["@bazel_tools//platforms:ppc"],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "arm",
    constraint_values = ["@bazel_tools//platforms:arm"],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "aarch64",
    constraint_values = ["@bazel_tools//platforms:aarch64"],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "s390x",
    constraint_values = ["@bazel_tools//platforms:s390x"],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "mac",
    constraint_values = ["@bazel_tools//platforms:osx"],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "ios",
    constraint_values = ["@bazel_tools//platforms:ios"],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "freebsd",
    constraint_values = ["@bazel_tools//platforms:freebsd"],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "android",
    constraint_values = ["@bazel_tools//platforms:android"],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "linux",
    constraint_values = ["@bazel_tools//platforms:linux"],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "windows",
    constraint_values = ["@bazel_tools//platforms:windows"],
    visibility = ["//visibility:public"],
)

alias(
    name = "mac_or_ios",
    actual = select({
        ":mac": "mac",
        ":ios": "ios",
        "//conditions:default": ":mac",
    }),
    visibility = ["//visibility:public"],
)

create_compiler_config_setting(
    name = "clang",
    value = "clang",
)

create_compiler_config_setting(
    name = "gcc",
    value = "gcc",
)

create_compiler_config_setting(
    name = "msvc",
    value = "msvc-cl",
)

create_compiler_config_setting(
    name = "clang_cl",
    value = "clang-cl",
)

alias(
    name = "clang_or_clang_cl",
    actual = select({
        ":clang": "clang",
        ":clang_cl": "clang_cl",
        "//conditions:default": ":clang",
    }),
    visibility = ["//visibility:public"],
)

config_setting(
    name = "debug",
    values = {
        "compilation_mode": "dbg",
    },
    visibility = ["//visibility:public"],
)

config_setting(
    name = "apple_debug",
    constraint_values = ["@bazel_tools//platforms:osx"],
    values = {"compilation_mode": "dbg"},
    visibility = ["//visibility:public"],
)

config_setting(
    name = "optimized",
    values = {
        "compilation_mode": "opt",
    },
    visibility = ["//visibility:public"],
)

config_setting(
    name = "asan",
    define_values = {
        "asan": "true",
    },
    visibility = ["//visibility:public"],
)

buildifier(
    name = "buildifier",
)
