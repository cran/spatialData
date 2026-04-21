test_that("neanderthal has correct dimensions", {
  data(neanderthal)
  expect_true(inherits(neanderthal, "sf"))
  expect_equal(nrow(neanderthal), 227)
  expect_equal(ncol(neanderthal), 27)
})

test_that("neanderthal_response has correct length", {
  data(neanderthal_response)
  expect_true(is.character(neanderthal_response))
  expect_equal(length(neanderthal_response), 1)
})

test_that("neanderthal_predictors has correct length", {
  data(neanderthal_predictors)
  expect_true(is.character(neanderthal_predictors))
  expect_equal(length(neanderthal_predictors), 25)
})
