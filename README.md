# Bazel Utils

This is a collection of bazel tools for internally used inside chokobole's projects.

## How to use

To use `bazel_utils`, add the followings to your `WORKSPACE` file.

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# If you want to use a specific version, use like below.
http_archive(
    name = "com_chokobole_bazel_utils",
    sha256 = "<sha256>",  # or just omit
    strip_prefix = "bazel_utils-<commit>",
    urls = [
        "https://github.com/chokobole/bazel_utils/archive/<commit>.tar.gz",
    ],
)

# Or if you just try, use like below.
http_archive(
    name = "com_chokobole_bazel_utils",
    strip_prefix = "bazel_utils-master",
    urls = [
        "https://github.com/chokobole/bazel_utils/archive/master.tar.gz",
    ],
)
```

Also add the followings to your `WORKSPACE` file for `buildifier`.

```python
load("@com_chokobole_bazel_utils//:buildifier_deps.bzl", "buildifier_deps")

buildifier_deps()

load("@com_chokobole_bazel_utils//:buildifier_deps_deps.bzl", "buildifier_deps_deps")

buildifier_deps_deps()
```

## Usages

### Debugging symbol for macOS

First set up your `.bazelrc`.

```bash
# Otherwise
cat bazel-your_workspace/external/com_chokobole_bazel_utils/.bazelrc.dsym >> .bazelrc
```

Use `dsym` macro like below. **NOTE: you have to set "testonly = 1", if you want to leave symbols on test.**

```python
load("@com_chokobole_bazel_utils//:dsym.bzl", "dsym")

dsym(name = name)
```

For example, if you want to leave symbols for "hello_world" binary, you can use like below.

```python
cc_binary(
    name = "hello_world",
    srcs = ["..."],
)

dsym(name = "hello_world")
```

For convenience, you can declare macro for it.

```python
def dsym_cc_binary(
    name,
    **kwargs):
    cc_binary(
        name = name,
        **kwargs
    )

    dsym(name = name)

def dsym_cc_test(
    name,
    **kwargs):
    cc_test(
        name = name,
        **kwargs
    )

    dsym(
        name = name,
        testonly = 1,
    )
```

And then rebuild and enjoy the debugging!

```bash
bazel build --config apple_debug //your_rule
```
