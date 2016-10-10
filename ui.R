library(shiny)
library(shinythemes)

# ui.R

shinyUI(fluidPage(theme = shinytheme("united"),
                  titlePanel("Next Word Prediction Project"),
                  br(),  
                  
                  sidebarLayout(
                      sidebarPanel(
                          helpText("This application will try to predict the next word in your sentence."),
                          textInput("userInput", "Please enter your sentance:", "I am really"),
                          submitButton("Run Model")
                      ),
                      
                      mainPanel(
                          h3("You entered:"),
                          textOutput("text1"),
                          br(),
                          h3("The resultant probabilities are:"),
                          dataTableOutput("prediction")
                      )
                  )
))