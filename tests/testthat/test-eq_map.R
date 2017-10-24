library(testthat)
library(earthquakes)
library(ggplot2)
library(dplyr)
library(lubridate)

test_that("test eq_map function", {
  filename <- system.file("extdata", "data.txt", package="earthquakes")
  raw_data <- earthquakes::load_data(filename)
  cleaned_data <- earthquakes::eq_clean_data(raw_data)
  cleaned_data <- earthquakes::eq_location_clean(cleaned_data)

  cleaned_data <- cleaned_data %>%
    dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(DATE) >= 2000)

  fig <- cleaned_data %>%
    dplyr::mutate(popup = earthquakes::eq_create_label(.)) %>%
    earthquakes::eq_map("popup")

  expect_true(fig$sizingPolicy$defaultWidth == "100%")
})
