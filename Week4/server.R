# Coursera - Developing Data Products- Course Project

# server.R file for the shiny app

# This app was developed to see how much PPP loan small business got on Virgin Island

library(shiny)
library(datasets)
library(dplyr)
library(tidyverse)

shinyServer(function(input, output) {
    
    hawaii <- read_csv("VI.csv", col_names = TRUE)
    hawaii$LoanAmount <- round(hawaii$LoanAmount)
    
    output$table <- renderDataTable({
        job_seq <- seq(from = input$job[1], to = input$job[2], by = 0.05)
        data <- transmute(hawaii, LoanAmount = LoanAmount, City=City,  BusinessType = BusinessType, 
                          RaceEthnicity = RaceEthnicity, Veteran = Veteran, JobsRetained = JobsRetained,
                          Lender = Lender, Gender = Gender)
        data <- filter(data, Veteran %in% input$veteran, Gender %in% input$gender, 
                       JobsRetained %in% job_seq, LoanAmount >= input$amt)
        data
    }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})