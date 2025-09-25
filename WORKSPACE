workspace(name = "bazel_devops_starter")

# Python rules
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_python",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.26.0/rules_python-0.26.0.tar.gz",
    sha256 = "1c5f5c4a26e07e6a9b2f69ecb8bb35e5c1d2ad23f57d5f2088d82f5c2ef78608",
)

load("@rules_python//python:repositories.bzl", "py_repositories")
py_repositories()