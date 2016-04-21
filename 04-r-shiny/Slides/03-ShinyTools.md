03 - Tools for Shiny Apps
========================================================
author: R Workshops
date: Fall 2014

Shiny Inputs
========================================================
Shiny has many different input options:
- `actionButton()` - creates a clickable button
- `checkboxInput()` and `checkboxGroupInput()`
- `dateInput()` - calendar to select a date
- `dateRangeInput()` - select a range of dates
- `fileInput()` - upload a file
- `numericInput()` - input a numeric value
- `radioButtons()` - select one or more items
- `sliderInput()` - slide along a range of values
- `textInput()` - input a string

Shiny Outputs
========================================================
Shiny also has many output options:
- `renderDataTable()` - outputs an interactive, sortable data table
- `htmlOutput()` - output html elements
- `renderPlot()` - output an R plot
- `renderPrint()` - output text from print() in R
- `renderTable()` - output an HTML table
- `renderText()` - output text from R
- `renderUI()` - output a custom part of the user interface
- `renderImage()` - print an image to the page

Other User Interface Options
========================================================
- `tabsetPanel()` - make multiple different output views (i.e. a plot in one tab, a data table in another)
- `helpText()` - create additional text to help users navigate your applet
- `submitButton()` - only update outputs when this button is clicked
- `conditionalPanel()` - only show certain UI options when conditions are met (i.e. if a certain tab is open, or a certain input is selected)

Your Turn
========================================================
Using your own data or the OkCupid dataset provided, create a simple Shiny app. 
Use the 03_OKCupid app as a starting point.


```r
runApp("shinyApps/03_OKCupid")
```

- Ideas: 
  - Plot some aspect of the data with color based on another aspect of the data
  - Use `subset()` and `checkboxInput()` to plot user-selected subsets
- Challenges:
  - Use `tabsetPanel()` to display different summaries or plots
  - Allow multiple input variables
  - Use if statements to output different plot types and let the user choose which plot type to output
