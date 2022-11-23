from pandera.typing import DataFrame

def patient_count_summary(input_data: DataFrame) -> DataFrame:
    """
    Summarizes the empanelment volume by practice

    Parameters
    ----------
    input_data : DataFrame
        Contains at least two columns: PracticeNM and MRN

    Returns
    -------
    DataFrame
        Summary of practices with their patient empanelment volumes
    """

    patient_count_summary_df = input_data.groupby(["PracticeNM"])["MRN"].agg('count').reset_index().rename(columns = {"MRN": "PatientCNT"})

    return patient_count_summary_df
