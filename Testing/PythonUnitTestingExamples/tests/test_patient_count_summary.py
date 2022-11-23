import numpy as np
import pandas as pd
from ..patient_count_summary import patient_count_summary


def test_patient_count_summary_shape():

    test_df = pd.DataFrame({"PracticeNM":["Practice A", "Practice B", "Practice A", "Practice C"],
                            "MRN":["001", "002", "003", "004"]
    })

    assert patient_count_summary(test_df).shape == (3,2)


def test_patient_count_summary_na_shape():
    test_df = pd.DataFrame({"PracticeNM":["Practice A", "Practice B", "Practice A", np.nan],
                            "MRN":["001", "002", "003", "004"]
    })

    assert patient_count_summary(test_df).shape == (3,2)

def test_patient_count_summary_na_mrn():

    test_df = pd.DataFrame({"PracticeNM":["Practice A", "Practice B", "Practice A", "Practice C"],
                            "MRN":["001", "002", "003", np.nan]
    })

    expected_output_df = pd.DataFrame({"PracticeNM":["Practice A", "Practice B", "Practice C"],
                            "PatientCNT":[2, 1, 0]
    })

    df = patient_count_summary(test_df)

    assert pd.testing.assert_frame_equal(df, expected_output_df) is None