library(shiny)
library(rCharts)
#options(RCHART_LIB = 'polycharts')

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("GTA House Sold Price!..help you finding the correct price of your dream home in the Greater Toronto Area"),
  p("To Get Started: Choose an area of your interest in the sidebar on left hand side;"),
  p("From there, you can select type of house,# of Bedroom/Washroom, and set Min/Max Price;"),
  p("Note: Map,Weekly Trend,Price War tabs on the right hand side are dynamic so that they are updated as you make selection."),
  
  
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      helpText(h5("Your Dream Home:")),
      br(),
      selectInput("region", 
                  label = "Choose a region",
                  choices = list("Markham",
                                 "Richmond Hill",
                                 "Toronto"),
                  selected = "Toronto"),
      selectInput("house_type", 
                  label = "Choose a house type",
                  choices = list("Att/Row/Tw",
                                 "Link",
                                 "Semi-Detac",
                                 "Detached"),
                  selected = "Detached"),
      sliderInput("min_bed",
                  "Min # of Bedroom(s):",
                  min = 1,
                  max = 5,
                  value = 3,
                  step = 1),
      sliderInput("min_bath",
                  "Min # of Washroom(s):",
                  min = 1,
                  max = 5,
                  value = 2,
                  step = 1),
      sliderInput("min_price",
                  "Min Sold Price:",
                  min = 100000,
                  max = 5000000,
                  value = 500000,
                  step = 200000),
      sliderInput("max_price",
                  "Max Sold Price:",
                  min = 500000,
                  max = 5000000,
                  value = 800000,
                   step = 200000),
      br(),
      helpText(h5("Map can take several minutes to load. So, only 10 are plotted each time.")),
      br(),
      sliderInput("next10",
                  "Plot next 10 House on Map",
                  min = 1,
                  max = 50,
                  value = 1,
                  step = 1)

#       actionButton("action", label = "Action")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Map",htmlOutput("distPlot")),
#       tabPanel("Histogram",plotOutput("plot")),
        tabPanel("Weekly Trend",showOutput("plot", "polycharts")),
        tabPanel("Price War",showOutput("price", "polycharts"))
        )     
    )
    )
))