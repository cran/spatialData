test_that("vi has correct dimensions", {
  data(vi)
  expect_true(inherits(vi, "sf"))
  expect_equal(nrow(vi), 9265)
  expect_equal(ncol(vi), 64)
})

test_that("vi_smol has correct dimensions", {
  data(vi_smol)
  expect_true(is.data.frame(vi_smol))
  expect_equal(nrow(vi_smol), 580)
  expect_equal(ncol(vi_smol), 65)
})

test_that("vi_responses has correct length", {
  data(vi_responses)
  expect_true(is.character(vi_responses))
  expect_equal(length(vi_responses), 5)
})

test_that("vi_predictors has correct length", {
  data(vi_predictors)
  expect_true(is.character(vi_predictors))
  expect_equal(length(vi_predictors), 58)
})
