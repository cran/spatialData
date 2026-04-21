test_that("trees has correct dimensions", {
  data(trees)
  expect_true(inherits(trees, "sf"))
  expect_equal(nrow(trees), 3373)
  expect_equal(ncol(trees), 53)
})

test_that("trees_response has correct length", {
  data(trees_response)
  expect_true(is.character(trees_response))
  expect_equal(length(trees_response), 1)
})

test_that("trees_predictors has correct length", {
  data(trees_predictors)
  expect_true(is.character(trees_predictors))
  expect_equal(length(trees_predictors), 50)
})
