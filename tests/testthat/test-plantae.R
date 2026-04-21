test_that("plantae has correct dimensions", {
  data(plantae)
  expect_true(inherits(plantae, "sf"))
  expect_equal(nrow(plantae), 662)
  expect_equal(ncol(plantae), 143)
})

test_that("plantae_responses has correct length", {
  data(plantae_responses)
  expect_true(is.character(plantae_responses))
  expect_equal(length(plantae_responses), 53)
})

test_that("plantae_predictors has correct length", {
  data(plantae_predictors)
  expect_true(is.character(plantae_predictors))
  expect_equal(length(plantae_predictors), 84)
})

test_that("plantae_west has correct class and dimensions", {
  data(plantae_west)
  expect_true(inherits(plantae_west, "sf"))
  expect_equal(nrow(plantae_west), 228)
  expect_equal(ncol(plantae_west), 91)
})

test_that("plantae_east has correct class and dimensions", {
  data(plantae_east)
  expect_true(inherits(plantae_east, "sf"))
  expect_equal(nrow(plantae_east), 434)
  expect_equal(ncol(plantae_east), 91)
})

test_that("plantae_west and plantae_east rows sum to plantae rows", {
  data(plantae_west)
  data(plantae_east)
  expect_equal(nrow(plantae_west) + nrow(plantae_east), 662)
})
