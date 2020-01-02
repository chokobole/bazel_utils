load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def buildifier_deps():
    if not native.existing_rule("io_bazel_rules_go"):
        http_archive(
            name = "io_bazel_rules_go",
            sha256 = "9fb16af4d4836c8222142e54c9efa0bb5fc562ffc893ce2abeac3e25daead144",
            urls = [
                "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/0.19.0/rules_go-0.19.0.tar.gz",
                "https://github.com/bazelbuild/rules_go/releases/download/0.19.0/rules_go-0.19.0.tar.gz",
            ],
        )

    if not native.existing_rule("bazel_gazelle"):
        http_archive(
            name = "bazel_gazelle",
            sha256 = "be9296bfd64882e3c08e3283c58fcb461fa6dd3c171764fcc4cf322f60615a9b",
            urls = [
                "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/0.18.1/bazel-gazelle-0.18.1.tar.gz",
                "https://github.com/bazelbuild/bazel-gazelle/releases/download/0.18.1/bazel-gazelle-0.18.1.tar.gz",
            ],
        )

    if not native.existing_rule("com_google_protobuf"):
        http_archive(
            name = "com_google_protobuf",
            strip_prefix = "protobuf-master",
            urls = ["https://github.com/protocolbuffers/protobuf/archive/master.zip"],
        )

    if not native.existing_rule("com_github_bazelbuild_buildtools"):
        http_archive(
            name = "com_github_bazelbuild_buildtools",
            strip_prefix = "buildtools-master",
            url = "https://github.com/bazelbuild/buildtools/archive/master.zip",
        )
