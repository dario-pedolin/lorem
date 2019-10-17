test_that("lorem prints x chapters", {

  trueValue <- 1:15

  testValue<- sapply(trueValue, function(x) length(gsub("[^$]", "\\1", utils::capture.output(lorem(x)))))

  expect_equal(testValue, trueValue)

})

test_that("lorem raises error if x is not integer or < 0", {

  expect_error(lorem("one"), "'x' must be an integer >= 0")

  expect_error(lorem(3.14), "'x' must be an integer >= 0")

  expect_error(lorem(-42), "'x' must be an integer >= 0")

})
