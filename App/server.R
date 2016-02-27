#Load libraries
library(shiny)
library(ggplot2)
library(DT)

#Load data 
data<- read.csv('data/junk.txt',header = T,sep = "\t")

#General data formats - Ideally should format all the date columns to this 
data$TransDt <-as.POSIXct(data$TransDt,format="%Y-%m-%d")
data$TransDt <- as.Date(data$TransDt)

shinyServer(function(input, output) {
  
  output$junk<- renderTable({
    table(data$Merchant)   
  }) 
  
  output$table <- DT::renderDataTable(DT::datatable({
    if (input$day != "All") {
      data <- data[data$TransDt == input$day,]
    }
    if (input$mer != "All") {
      data <- data[data$Merchant == input$mer,]
    }
    if (input$agency != "All") {
      data <- data[data$AgencyGLKey == input$agency,]
    }
    if (input$fund != "All") {
      data <- data[data$FundKey == input$fund,]
    }
    if (input$account != "All") {
      data <- data[data$AccountKey == input$account,]
    }
    data
  }))
  
})