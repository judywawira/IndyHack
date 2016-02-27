library(shiny)
library(ggplot2)
library(DT)

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
                                              unique(as.character(data$TransDt))))
                         ),
                         column(4,
                                selectInput("mer",
                                            "Merchant:",
                                            c("All",
                                              unique(as.character(data$Merchant))))
                         ),
                         column(4,
                                selectInput("agency",
                                            "Agency:",
                                            c("All",
                                              unique(as.character(data$AgencyGLKey))))
                         ),
                         column(4,
                                selectInput("fund",
                                            "Fund:",
                                            c("All",
                                              unique(as.character(data$FundKey))))
                         ),
                         column(4,
                                selectInput("account",
                                            "Account:",
                                            c("All",
                                              unique(as.character(data$AccountKey))))
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
                         
                       ),
                       mainPanel()
                     )
                   ) #end tab panel
        )#end nav bar
)


