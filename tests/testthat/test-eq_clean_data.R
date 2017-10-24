library(testthat)
library(earthquakes)

test_that("test eq_clean_data function", {

  firstColumnNames <- c("I_D","FLAG_TSUNAMI","YEAR","MONTH","DAY","HOUR")

  filename <- system.file("extdata", "data.txt", package="earthquakes")
  raw_data <- earthquakes::load_data(filename)
  cleaned_data <- earthquakes::eq_clean_data(raw_data)
  lat_lon_are_numeric <- any(!(
    apply(cleaned_data,2,class)[
      names(cleaned_data) %in% c("LATITUDE","LONGITUDE")
    ] == c("character","character")
  ))

  expect_true(!lat_lon_are_numeric)
})
