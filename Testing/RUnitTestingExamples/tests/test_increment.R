source("../increment.R", chdir = TRUE)
library(testthat)


test_that("increment single number", {
  expect_equal(increment(-1), 0)
  expect_equal(increment(0), 1)
})

test_that("increment vectors", {
  expect_equal(increment(c(0, 1)), c(1, 2))
})

test_that("increment empty vector", {
  expect_equal(increment(c()), c())
})

test_that("increment test NA", {
  expect_true(is.na(increment(NA)))
})
