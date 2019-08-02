import pytest
import module

def test_square():
    num = 5
    square = module.square_number(num)
    assert 25 == square