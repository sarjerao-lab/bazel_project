# Copyright 2024 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Values and helpers for pip_repository related flags.

NOTE: The transitive loads of this should be kept minimal. This avoids loading
unnecessary files when all that are needed are flag definitions.
"""

load("@bazel_skylib//rules:common_settings.bzl", "string_flag")
load("//python/private:enum.bzl", "enum")

# Determines if we should use whls for third party
#
# buildifier: disable=name-conventions
UseWhlFlag = enum(
    # Automatically decide the effective value based on environment, target
    # platform and the presence of distributions for a particular package.
    AUTO = "auto",
    # Do not use `sdist` and fail if there are no available whls suitable for the target platform.
    ONLY = "only",
    # Do not use whl distributions and instead build the whls from `sdist`.
    NO = "no",
)

# Determines whether universal wheels should be preferred over arch platform specific ones.
#
# buildifier: disable=name-conventions
UniversalWhlFlag = enum(
    # Prefer platform-specific wheels over universal wheels.
    ARCH = "arch",
    # Prefer universal wheels over platform-specific wheels.
    UNIVERSAL = "universal",
)

# Determines which libc flavor is preferred when selecting the linux whl distributions.
#
# buildifier: disable=name-conventions
WhlLibcFlag = enum(
    # Prefer glibc wheels (e.g. manylinux_2_17_x86_64 or linux_x86_64)
    GLIBC = "glibc",
    # Prefer musl wheels (e.g. musllinux_2_17_x86_64)
    MUSL = "musl",
)

INTERNAL_FLAGS = [
    "dist",
    "whl_plat",
    "whl_plat_py3",
    "whl_plat_py3_abi3",
    "whl_plat_pycp3x",
    "whl_plat_pycp3x_abi3",
    "whl_plat_pycp3x_abicp",
    "whl_py2_py3",
    "whl_py3",
    "whl_py3_abi3",
    "whl_pycp3x",
    "whl_pycp3x_abi3",
    "whl_pycp3x_abicp",
]

def define_pypi_internal_flags(name):
    for flag in INTERNAL_FLAGS:
        string_flag(
            name = "_internal_pip_" + flag,
            build_setting_default = "",
            values = [""],
            visibility = ["//visibility:public"],
        )
