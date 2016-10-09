library(shiny) 
library(ggplot2) 
data <- diamonds 

shinyServer(function(input, output) { 
	jm <- reactive({ 
		paste("carat ~", " as.integer(", input$a,")") 
		}) 
	
	regression <- reactive({ 
		lm(as.formula(jm()),data=data) 
	}) 
 
	output$summary <- renderPrint({ 
		predictor <- input$a 
		if(predictor == "depth") 
			summary(diamonds$depth) 
		else if(predictor == "table") 
			summary(diamonds$table) 
		else if(predictor == "x") 
			summary(diamonds$x) 
		else if(predictor == "y") 
			summary(diamonds$y) 
		else if(predictor == "z") 
			summary(diamonds$z) 
		else if(predictor == "carat") 
			summary(diamonds$carat) 
		}) 

	output$text <- renderText({ 
		paste("Regression Model:", "carat ~", input$a) 
	}) 
	
 
	output$myPlot <- renderPlot ({ 
		with(data, {plot(as.formula(jm()),xlab=input$a,ylab="carat") 
		abline(regression(), col=input$color) 
		}) 
	}) 
	}) 
