## Server.R to calculate plotting based on ui.R input

library(shiny)
library(ggplot2)

function(input, output) {

## use diamonds dataset present in ggplot 2 library
  dataset <- reactive({
    diamonds[sample(nrow(diamonds), input$sampleSize),]
  })

## interactive plot using renderPlot
  output$plot <- renderPlot({

##ggplot using inputted x and y values

    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
##ggplot using inputted x and y values
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)

    facets <- paste(input$facet_row, '~', input$facet_col)
    if (facets != '. ~ .')
      p <- p + facet_grid(facets)

    if (input$jitter)
      p <- p + geom_jitter()
    if (input$smooth)
      p <- p + geom_smooth()

    print(p)

  }, height=700)

}