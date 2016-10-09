library(shiny) 
library(datasets) 
library(ggplot2) 
require(graphics) 
shinyUI(fluidPage( 
headerPanel(img(src = "ddp.jpg"), 
	h2("Data Products Assignment") ), 
	
	# description and input 
	sidebarPanel( 
		h3('Fill in the predictor for the diamond data set'), 
		p('Here you can add different values for the diamonds data.'), 
		p('Select the predictor variable with carat as outcome:'), 
		selectInput('a', label='Predictor', selected='depth', choices=names(diamonds)), 
		p('Here you can choose different colors for the line.'), 
		selectInput('color', label='Color', choices=palette()), 
		h3('Documentation'), 
		p("For the assignment Data Products I make use of the", 			
		"diamonds' dataset. You can plot the regression model",
		"using two variables. One is the predictor, and the", 
		"other is 'carat' as the outcome. With the field color",
		"you can adjust the regression line.")),
		 
		# plot and output 
		mainPanel( 
			div(h2("Data Products Assignment", 			
			style="color:#ff6600;margin:-65px 0px 10px 20px;")), 
			h4('Summary of Selected Attribute'), 
			h4(verbatimTextOutput("summary")), 
			h4(textOutput('text')), 
			plotOutput('myPlot')) 
)) 
