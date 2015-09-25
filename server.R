HeartDiseaseRisk<-function(gender,age,cigsPerDay,totChol,sysBP,glucose){
  Logy<- -9.496692+0.440083*gender+0.066553*age+0.020706*cigsPerDay+0.002897*totChol+0.018244*sysBP+0.009031*glucose
  y<-exp(Logy)
  isRisk<- y>0.5
  if (isRisk==1) print("You are UNDER RISK to develop a coronary heart disease in the next 10 years") else print("You have LOW RISK to develope a coronary heart disease in the next 10 years")
 
}

shinyServer(
  function (input,output) {
    
    genderInput <- reactive({
      switch(input$gender,
             "Male" = 1,
             "Female" = 0)
            
    })
    observeEvent(input$do, {
      output$risk<-renderPrint({
        gender<-genderInput()
        HeartDiseaseRisk(gender,input$age,input$cigsPerDay,input$totChol,input$sysBP,input$glucose)
    })})
    
  }
)