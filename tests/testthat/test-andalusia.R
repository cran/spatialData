test_that("andalusia has correct dimensions", {
  data(andalusia)
  expect_true(inherits(andalusia, "sf"))
  expect_equal(nrow(andalusia), 46465)
  expect_equal(ncol(andalusia), 3)
})

test_that("andalusia_responses has correct length", {
  data(andalusia_responses)
  expect_true(is.character(andalusia_responses))
  expect_equal(length(andalusia_responses), 2)
})

test_that("andalusia_predictors has correct length", {
  data(andalusia_predictors)
  expect_true(is.character(andalusia_predictors))
  expect_equal(length(andalusia_predictors), 20)
})
