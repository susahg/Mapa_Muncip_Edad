library(shiny)
library(DT)

dataset <- read.csv("212790-0-centros-educacion.csv", sep = ";")

server <- shinyServer(function(input, output, session) {

  filteredData <- reactive({
    dataset[as.character(dataset$TIPO) == input$tipo & as.character(dataset$DISTRITO) == input$distrito, ]
  })
  
    
  output$map <- renderLeaflet({
    leaflet(data=filteredData()) %>%
      addTiles(
        urlTemplate = "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
      ) %>%
      addMarkers(lng = ~LONGITUD, lat = ~ LATITUD, popup = ~as.character(NOMBRE), label = ~as.character(NOMBRE))
  })
  
  
  output$x3 = downloadHandler('Mi-select.csv', content = function(file) {
    write.csv(filteredData(), file)
  })
  
})


#output$filteredTable <- DT::renderDataTable({
#  datatable(
#    filteredTable_data(),
#    selection = list(mode = "multiple"),
#    caption = "Filtered Table (based on cyl)"
#  )
#})

