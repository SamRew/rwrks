02 - Structure of a Shiny Applet
========================================================
author: R Workshops
date: Fall 2014


A Tale of Two Files
========================================================

The quickest/easiest way to create a shiny app is to define the user interface in a file named **ui.R** and the server side functionality in **server.R**.

- [**ui.R**](http://heike.github.io/rwrks/06-r-shiny/Code/Skeleton/ui.R) defines the page layout and user interface
- [**server.R**](http://heike.github.io/rwrks/06-r-shiny/Code/Skeleton/server.R) contains the R code to create any output

ui.R
========================================================


```r
library(shiny)

# Define UI for new application
shinyUI(fluidPage(

  # Application title
  titlePanel("Title"),
  
  sidebarLayout(
      sidebarPanel(
          # Inputs go here
      ),
      
      mainPanel(
          # Outputs go here
      )
  )
))
```

ui.R
========================================================
- Defines the `shinyUI()` function, which contains elements that describe the HTML page
- Typical applets are constructed using the `sidebarLayout()` function, which creates a side bar generally used for input and a main panel used for output
- Elements are hierarchical functions:  
components in the sidebar go into the `sidebarPanel()` function, separated by commas
- Input variables are named in `ui.R` and then referenced in `server.R`

server.R
========================================================

```r
library(shiny)

# Define server logic required to create application output
shinyServer(function(input, output) {

})
```

server.R
========================================================

- Defines the `shinyServer()`, which is a function with input and output variables. 
- Contains all of the R code to generate any output
- (Later) can also be used to modify inputs
- Generally much longer than `ui.R` - all the interesting stuff happens in `server.R`


Shiny Interactivity
========================================================

```r
library(shiny)
runExample("02_text")
```

Type | Objects | Description 
----- | ----------------- | -----------------------------------
Input | Dataset | Choose a dataset from a dropdown list
Input | # Observations | Size of the table to display
Output | Summary | summary statistics for each variable
Output | Table | First n observations of the data table

Shiny Interactivity
========================================================
left:40%
Input
- dropdown list
- numeric input

Output 
- text
- table 

***
<center>
<img src="02-ShinyStructure-figure/shiny-text.png" alt="Picture of Shiny Text Applet">
</center>

Shiny Interactivity
========================================================

Input   | Shiny UI syntax
------------- | ----------------------------------------------
dropdown list | `selectInput(inputId, label, choices, selected = NULL, multiple = FALSE)`
numeric input | `numericInput(inputId, label, value, min = NA, max = NA, step = NA)`

Output  | Shiny UI syntax
----------- | ---------------
text | `verbatimTextOutput(outputId)`
table | `tableOutput(outputId)`


Reactivity
========================================================
Shiny applets work because of *reactive expressions*, which automatically update outputs when  input values change. 

```
input values => R code => output values
```

**Reactive expressions** keep track of what values they read and what values they change. If those values become "out of date", they know their return value is out of date and will automatically recalculate.

Reactivity
========================================================
We can create a reactive expression by passing a normal expression into `reactive`. 


```r
datasetInput <- reactive({
   switch(input$dataset,
          "rock" = rock,
          "pressure" = pressure,
          "cars" = cars)
})
```

This statement checks to see if `input$dataset` contains "rock", "pressure", or "cars", then stores the corresponding data into the variable `datasetInput`.

Reactivity
========================================================
Reactive values can be turned into `output` objects that are passed to the shinyServer function. 

This output depends on both the dataset and the number of observations. 


```r
output$view <- renderTable({
   head(datasetInput(), n = input$obs)
})
```

Whenever either the dataset or the number of observations changes, this function will be re-executed and the output will change.

Reactivity
========================================================

```r
runExample("03_reactivity")
```

Let's take a look at the [ui.R](http://heike.github.io/rwrks/06-r-shiny/Code/Applet3/ui.R) and [server.R](http://heike.github.io/rwrks/06-r-shiny/Code/Applet3/server.R) files that create the applet




