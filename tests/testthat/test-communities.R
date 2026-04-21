test_that("communities has correct dimensions", {
  data(communities)
  expect_true(inherits(communities, "sf"))
  expect_equal(nrow(communities), 6747)
  expect_equal(ncol(communities), 16)
})

test_that("communities_responses has correct length", {
  data(communities_responses)
  expect_true(is.character(communities_responses))
  expect_equal(length(communities_responses), 6)
})

test_that("communities_predictors has correct length", {
  data(communities_predictors)
  expect_true(is.character(communities_predictors))
  expect_equal(length(communities_predictors), 9)
})
