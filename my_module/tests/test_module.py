import pytest
from my_module import my_module

# every test starts with "test"
def test_square():
    num = 5
    square = my_module.square_number(num)
    assert 25 == square