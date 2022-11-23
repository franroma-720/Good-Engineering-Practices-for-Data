source("../patient_count_summary.R", chdir = TRUE)
library(testthat)


test_df <- data.frame(
  PracticeNM = c("Practice A", "Practice B", "Practice A", "Practice C"),
  MRN = c("001", "002", "003", "004")
)

test_that("patient_count_summary dim", {
  expect_equal(dim(patient_count_summary(test_df)), c(3, 2))
})


test_practice_na_df <- data.frame(
  PracticeNM = c("Practice A", "Practice B", "Practice A", NA),
  MRN = c("001", "002", "003", "004")
)

test_that("patient_count_summary NA dim", {
  expect_equal(dim(patient_count_summary(test_practice_na_df)), c(3, 2))
})


test_mrn_na_df <- data.frame(
  PracticeNM = c("Practice A", "Practice B", "Practice A", "Practice C"),
  MRN = c("001", "002", "003", NA)
)

expected_output_df <- data.frame(
  PracticeNM = c("Practice A", "Practice B", "Practice C"),
  PatientCNT = c(2, 1, 0)
)

test_that("patient_count_summary NA MRN", {
  expect_equal(patient_count_summary(test_mrn_na_df), expected_output_df)
})
