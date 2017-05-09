library(shiny)
library(leaflet)
library(datasets)
#library(rCharts)

#r_colors <- rgb(t(col2rgb(colors()) / 255))
#names(r_colors) <- colors()

#ui <- fluidPage(
#  leafletOutput("map"),
#   p(),
#  actionButton("recalc", "New points")
#)

dataset <- read.csv("212790-0-centros-educacion.csv", sep = ";")

ui <- fluidPage(
  title <- ("LOCALIZADIOR COLEGIOS"),
  leafletOutput('map'),
  
  
  hr(),
  lst.tipo <- as.list(unique(dataset$tipo)),
  fluidRow(
    column(3,
           offset = 1,
           selectInput(inputId = "tipo", 
                       label = "Selecciona Tipo", 
                       choices = unique(as.character(dataset$TIPO)),width = "1500px",selectize = FALSE)
    ),
    column(4, offset = 1,
           selectInput(inputId = "distrito", 
                       label = "Selecciona Distrito", 
                       choices = unique(as.character(dataset$DISTRITO)),width = "100%",selectize = FALSE)
    )
  ),
  fluidRow(
    hr(),
    p(class = 'text-center', downloadButton('x3', 'Download Filtered Data'))
  )
)
  
  
