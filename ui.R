library(shiny)

shinyUI(fluidPage(
  titlePanel("Cardiovascular heart disease prediction"),
  helpText("This application predicts whether a person is at risk of contracting cardiovascular disease in the next 10 years."),
  helpText("The logistic regression model was generated with data from the Framingham Heart Study, a long term prospective study of the etiology of cardiovascular
disease among a population of free living subjects in the community of Framingham,Massachusetts."),
  helpText("To get your prediction, just fill the formulary and click the button. The output will appear at the bottom of the page."),
  
  sliderInput('age', 'Years', 30, min = 0, max = 100, step = 1),
  selectInput("gender", "Choose your gender:", 
              choices = c("Male", "Female")),
  sliderInput('cigsPerDay', 'Number of cigarettes smoked each day', 0, min = 0, max = 90, step = 1),
  sliderInput('totChol', 'Serum Total Cholesterol (mg/dL)', 107, min = 107, max = 699, step = 1),
  sliderInput('sysBP', 'Systolic Blood Pressure (mean of last two of three measurements) (mmHg)', 83.5, min = 83.5, max = 295,step=0.5),
  sliderInput('glucose', 'Casual serum glucose (mg/dL)', 49, min = 39, max = 478,step=1),
  actionButton("do","Calculate"),
  verbatimTextOutput("risk"),
  helpText("For more information, yo can access to https://biolincc.nhlbi.nih.gov/static/studies/teaching/framdoc.pdf"),
  helpText("This logistic regression model uses the most important variables available in the data set used, in order to simplify the formulary without a significant variation in the model's accuracy."),
  helpText("This application is just for academic purpose.")
  
)
  
)
