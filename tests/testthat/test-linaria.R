test_that("linaria has correct dimensions", {
  data(linaria)
  expect_true(inherits(linaria, "sf"))
  expect_equal(nrow(linaria), 7386)
  expect_equal(ncol(linaria), 25)
})

test_that("linaria_responses has correct length", {
  data(linaria_responses)
  expect_true(is.character(linaria_responses))
  expect_equal(length(linaria_responses), 2)
})

test_that("linaria_predictors has correct length", {
  data(linaria_predictors)
  expect_true(is.character(linaria_predictors))
  expect_equal(length(linaria_predictors), 20)
})
