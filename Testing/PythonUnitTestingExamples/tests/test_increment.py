import numpy as np
from ..increment import increment

def test_increment_single_number():
    assert increment(-1) == 0
    assert increment(0) == 1

def test_increment_nan():
    np.testing.assert_equal(increment(np.nan), np.nan)

def test_empty_array():
    np.testing.assert_equal(increment(np.array([])), np.array([]))

def test_nan_inf_array():
    np.testing.assert_equal(increment(np.array([np.nan, np.inf])), np.array([np.nan, np.inf]))
