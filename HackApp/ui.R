library(shiny)
library(ggplot2)
library(DT)
library(rCharts)

options(scipen=999)
mydata<- read.csv('data/junk.txt',header = T,sep = "\t")

#General data formats - Ideally should format all the date columns to this 
mydata$TransDt <-as.POSIXct(mydata$TransDt,format="%Y-%m-%d")
mydata$TransDt <- as.Date(mydata$TransDt)

shinyUI(navbarPage("#IndyHacks",
                   tabPanel(
                     "Home",
                     fluidPage(
                       titlePanel("Detailed Dashboard"),
                       
                       # Create a new Row in the UI for selectInputs
                       fluidRow(
                         column(4,
                                selectInput("day",
                                            "Date of Transaction:",
                                            c("All",
                                              unique(as.character(mydata$TransDt))))
                         ),
                         column(4,
                                selectInput("mer",
                                            "Merchant:",
                                            c("All",
                                              unique(as.character(mydata$Merchant))))
                         ),
                         column(4,
                                selectInput("agency",
                                            "Agency:",
                                            c("All",
                                              unique(as.character(mydata$AgencyGLKey))))
                         ),
                         column(4,
                                selectInput("fund",
                                            "Fund:",
                                            c("All",
                                              unique(as.character(mydata$FundKey))))
                         ),
                         column(4,
                                selectInput("account",
                                            "Account:",
                                            c("All",
                                              unique(as.character(mydata$AccountKey))))
                         )
                       ),
                       # Create a new row for the table.
                       fluidRow(
                         DT::dataTableOutput("table")
                       )
                     )
                   ), #end tab panel
                   tabPanel(
                     "Graphs",
                     sidebarLayout(
                       sidebarPanel(
                         "Time series"
                       ),
                       mainPanel(tableOutput('junk'))
                     )
                   ) #end tab panel
        )#end nav bar
)


