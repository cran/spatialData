test_that("quercus has correct dimensions", {
  data(quercus)
  expect_true(inherits(quercus, "sf"))
  expect_equal(nrow(quercus), 6728)
  expect_equal(ncol(quercus), 33)
})

test_that("quercus_response has correct length", {
  data(quercus_response)
  expect_true(is.character(quercus_response))
  expect_equal(length(quercus_response), 1)
})

test_that("quercus_predictors has correct length", {
  data(quercus_predictors)
  expect_true(is.character(quercus_predictors))
  expect_equal(length(quercus_predictors), 31)
})
