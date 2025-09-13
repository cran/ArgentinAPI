## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ArgentinAPI)
library(dplyr)
library(ggplot2)

## ----argentine-senators,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

# Display the first 10 Argentine senators

argentine_senators <- head(get_argentine_senators(),n=10)

print(argentine_senators)


## ----argentina-gdp,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----


argentina_gdp <- head(get_argentina_gdp())

print(argentina_gdp)


## ----argentina-life-expectancy,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

argentina_life_expectancy <- head(get_argentina_life_expectancy())

print(argentina_life_expectancy)


## ----corn-yield-plot, message=FALSE, warning=FALSE, fig.width=7, fig.height=5----

# Summary: average corn yield by nitrogen level
corn_summary <- corn_nitrogen_df %>%
  group_by(nitro) %>%
  summarise(
    mean_yield = mean(yield, na.rm = TRUE),
    .groups = "drop"
  )

# Plot: nitrogen vs. average corn yield
ggplot(corn_summary, aes(x = nitro, y = mean_yield)) +
  geom_line(color = "#1f77b4", size = 1) +
  geom_point(size = 2, color = "#1f77b4") +
  labs(
    title = "Corn Yield by Nitrogen Level",
    x = "Nitrogen Level (kg/ha)",
    y = "Average Yield (quintals/ha)"
  ) +
  theme_minimal()



