test_that("interaction has correct dimensions", {
  x <- spatialData::interaction
  expect_true(inherits(x, "sf"))
  expect_equal(nrow(x), 1000)
  expect_equal(ncol(x), 14)
})

test_that("interaction_responses has correct length", {
  data(interaction_responses)
  expect_true(is.character(interaction_responses))
  expect_equal(length(interaction_responses), 3)
})

test_that("interaction_predictors has correct length", {
  data(interaction_predictors)
  expect_true(is.character(interaction_predictors))
  expect_equal(length(interaction_predictors), 10)
})
