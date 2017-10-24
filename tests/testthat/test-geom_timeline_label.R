library(testthat)
library(earthquakes)
library(ggplot2)

test_that("test eq_clean_data function", {
  filename <- system.file("extdata", "data.txt", package="earthquakes")
  raw_data <- earthquakes::load_data(filename)
  cleaned_data <- earthquakes::eq_clean_data(raw_data)
  cleaned_data <- earthquakes::eq_location_clean(cleaned_data)

  timeline_plot <- ggplot(
    cleaned_data,
    aes(x = DATE, label = LOCATION_NAME, magnitude = EQ_MAG_MW)
  )+
    earthquakes::geom_timeline()+
    earthquakes::geom_timeline_label()

  expect_true(class(timeline_plot$layers[[2]]$geom)[1] == "geom_timeline_label_proto_class")
})
