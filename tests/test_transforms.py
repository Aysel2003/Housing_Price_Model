import numpy as np
from housing_model.features import safe_ratio, safe_log1p


def test_safe_ratio_div_by_zero():
    X = np.array([[10, 2], [5, 0]])
    y = safe_ratio(X)
