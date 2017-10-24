library(testthat)
library(earthquakes)

test_that("test eq_location_clean function", {

  firstColumnNames <- c("I_D","FLAG_TSUNAMI","YEAR","MONTH","DAY","HOUR")

  filename <- system.file("extdata", "data.txt", package="earthquakes")
  raw_data <- earthquakes::load_data(filename)
  cleaned_data <- earthquakes::eq_location_clean(raw_data)
  countryData <- cleaned_data$LOCATION_NAME == "MEXICO"
  countryData <- countryData[!is.na(countryData)]
  countryData <- any(countryData)

  expect_true(!countryData)
})
