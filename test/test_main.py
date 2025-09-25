from helper import greet

def test_greet():
    assert greet("Tester") == "Hello, Tester! Bazel build works."
