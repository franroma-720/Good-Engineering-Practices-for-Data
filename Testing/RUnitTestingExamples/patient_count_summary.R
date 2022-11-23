library(dplyr)

#' Summarizes the empanelment volume by practice
#'
#' @param   input_data   A tibble containing at least two columns:
#'                       PracticeNM and MRN
#' @return  A tibble of practices with their patient empanelment volume

patient_count_summary <- function(input_data) {
  input_data %>%
    group_by(PracticeNM) %>%
    summarise(PatientCNT = n())
}
