library(shiny)
mydata<- read.csv('data/junk.txt',header = T,sep = "\t")

shinyServer(function(input, output) {
  
  output$junk<- renderTable({
    table(mydata$Merchant)   
  })    
  
})