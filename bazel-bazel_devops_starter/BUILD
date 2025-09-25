# Python library
py_library(
    name = "helper_lib",
    srcs = ["helper.py"],
    visibility = ["//visibility:public"],
)

# Python binary
py_binary(
    name = "main_app",
    srcs = ["main.py"],
    main = "main.py",
    deps = [":helper_lib"],
)
