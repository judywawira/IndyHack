#Load libraries
library(shiny)
library(ggplot2)
library(DT)
library(rCharts)

#Load data 
mydata<- read.csv('data/junk.txt',header = T,sep = "\t")

#General data formats - Ideally should format all the date columns to this 
mydata$TransDt <-as.POSIXct(mydata$TransDt,format="%Y-%m-%d")
mydata$TransDt <- as.Date(mydata$TransDt)

shinyServer(function(input, output) {
  
  output$junk<- renderTable({
    table(mydata$Merchant)   
  }) 
  
  output$table <- DT::renderDataTable(DT::datatable({
    if (input$day != "All") {
      mydata <- mydata[mydata$TransDt == input$day,]
    }
    if (input$mer != "All") {
      mydata <- mydata[mydata$Merchant == input$mer,]
    }
    if (input$agency != "All") {
      mydata <- mydata[mydata$AgencyGLKey == input$agency,]
    }
    if (input$fund != "All") {
      mydata <- mydata[mydata$FundKey == input$fund,]
    }
    if (input$account != "All") {
      mydata <- mydata[data$AccountKey == input$account,]
    }
    mydata
  }))
  
})