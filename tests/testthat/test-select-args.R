test_that("warns on invalid input", {
  tag <- roxy_test_tag()

  expect_snapshot({
    select_args_text(sum, "-xlab:", tag)
    select_args_text(sum, '"a"', tag)
    select_args_text(function(x, y, z) {}, "-x:z", tag)
  })
})

test_that("positive initial values starts from nothing", {
  f <- function(x, y, z) {}

  expect_equal(select_args_text(f, "x y"), c("x", "y"))
})

test_that("negative initial starts from everything", {
  f <- function(x, y, z) {}

  expect_equal(select_args_text(f, "-z"), c("x", "y"))
})

test_that("can alternative exclusion and inclusion", {
  f <- function(x, y, z) {}

  expect_equal(select_args_text(f, "-z z"), c("x", "y", "z"))
  expect_equal(select_args_text(f, "z -z"), character())
})
