# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app

# This app was developed to see how much PPP loan small business got on Virgin Island 

library(markdown)

shinyUI(navbarPage("PPP Loan Summary for Virgin Island",
                   tabPanel("Table",
                            
                            # Sidebar
                            sidebarLayout(
                                sidebarPanel(
                                    helpText("Provide information about the data that you want."),
                                    numericInput('amt', 'Loan Amount greater than:', 104000, min = 80, max = 150000),
                                    checkboxGroupInput('gender', 'Gender:', c("Unanswered"="Unanswered", "Male Owned"="Male Owned", "Female Owned"="Female Owned"), selected = c("Unanswered","Male Owned","Female Owned")),
                                    checkboxGroupInput('veteran', 'Veteran:', c("Unanswered"="Unanswered", "Non-Veteran"="Non-Veteran", "Veteran"="Veteran"), selected = c("Unanswered","Non-Veteran","Veteran")),
                                    sliderInput('job', 'Job Retained', min=1, max=50, value=c(1,50), step=5)
                                ),
                                
                                
                                mainPanel(
                                    dataTableOutput('table')
                                )
                            )
                   ),
                   tabPanel("About",
                            mainPanel(
                                includeMarkdown("about.md")
                            )
                   )
)
)   