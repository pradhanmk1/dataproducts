## ur.R to get the input for plotting
library(shiny)
library(ggplot2)

dataset <- diamonds
## use the fluidPage layout.
fluidPage(

  titlePanel("Diamonds Explorer"),

  sidebarPanel(

## use the slider Input for sample size.
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(1000, nrow(dataset)), step=500, round=0),

## use the select Input for x and y values, color,facet row and facet column.
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset))),

## use the checkbox Input for Jitter and Smooth.
    checkboxInput('jitter', 'Jitter'),
    checkboxInput('smooth', 'Smooth'),

    selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
    selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
  ),

  mainPanel(
    plotOutput('plot')
  )
)