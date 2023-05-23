sheet_names <- excel_sheets("Ordinal.xlsx")

# prepare empty data frame
column_names <- c("IV", "DV", "l2l test validity", "l2l statistic", "l2l p value", 
                  "l2l significance", "Chi2 statistic (dof =1)", "Kendall tau validity", "tau statistic", "tau p value", 
                  "tau significance", "tau z stat", "tau estimate","JT validity", "JT statistic", 
                  "JT p value", "JT significance", "JT z stat","Cuzick validity", "Cuzick statistic", 
                  "Cuzick p value", "Cuzick significance", "Cuzick z stat" )

df = data.frame(matrix(nrow = 0, ncol = length(column_names)))
colnames(df) <- column_names


for (sheet in sheet_names){
  
  # read the data in one worksheet
  data <- read_excel("Ordinal.xlsx", sheet = sheet)
  
  # convert into a table for the tests to read
  tab_temp <- table(data$`Rating IV`, data$`Rating DV`)
  
  # l2l test
  test <- lbl_test(tab_temp)
  l2l_validity <- if (colnames(data)[1] == "7-43-5") "not valid" else "valid"
  l2l_statistic <- statistic(test)
  l2l_pvalue <-pvalue(test)
  l2l_sig <- if (l2l_pvalue < 0.05) "significant" else "not significant"
  Chi2_value_dof1 <- l2l_statistic^2
  
  data$`Rating IV`<- factor(data$`Rating IV`, ordered = TRUE, levels= sort(unique(data$`Rating IV`)))
  data$`Rating DV`<- factor(data$`Rating DV`, ordered = TRUE, levels= sort(unique(data$`Rating DV`)))
  
  # kendal tau
  kendal_validity <- if (colnames(data)[1] == "7-43-5") "not valid" else "valid"
  if (length(unique(data$`Rating IV`)) == length(unique(data$`Rating DV`))) {
    tau_statistic <- KendallTauB(tab_temp)
    test <- cor.test(~ as.numeric(data$`Rating IV`) + as.numeric(data$`Rating DV`), method="kendall")
    tau_pvalue <- test$p.value
    tau_sig <- if (tau_pvalue < 0.05) "significant" else "not significant"
    tau_zstat <- test$statistic
    tau_estimate <- test$estimate
    
  }else {
    ConfLevel = 0.95
    tau_statistic <- StuartTauC(tab_temp, conf.level= ConfLevel)
    Q <- abs(qnorm((1-ConfLevel)/2))
    SE <- abs((tau_statistic[3] - tau_statistic[1])) / Q
    tau_pvalue <- 2*pnorm(abs(tau_statistic[1]), mean=0, sd=SE, lower.tail=FALSE)
    tau_sig <- if (tau_pvalue < 0.05) "significant" else "not significant"
    tau_zstat <- sign(tau_statistic[1]) * qnorm(tau_pvalue/2, lower.tail=FALSE)
    tau_estimate <- tau_statistic
  }
  
  
  # jonckheere test
  jonk_validity <- if (colnames(data)[1] == "7-43-5") "not valid" else "valid"
  test <- jonckheereTest(data$`Rating IV`, data$`Rating DV`)
  jonk_statistic <-test$estimates
  jonk_pvalue <- test$p.value
  jonk_sig <- if (jonk_pvalue < 0.05) "significant" else "not significant"
  jonk_zstat <- test$statistic
  
  # cuzick test
  cuzick_validity <- if (colnames(data)[1] == "7-43-5") "not valid" else "valid"
  test <- cuzickTest(data$`Rating IV`, data$`Rating DV`)
  cuzick_statistic <-test$estimate
  cuzick_pvalue <- test$p.value
  cuzick_sig <- if (cuzick_pvalue < 0.05) "significant" else "not significant"
  cuzick_ztest <- test$statistic
  

  #df <- rbind(df, result)
  df[nrow(df)+1,] <- c(as.character(colnames(data)[1]), as.character(colnames(data)[2]),l2l_validity, l2l_statistic, l2l_pvalue, 
                       l2l_sig, Chi2_value_dof1, kendal_validity, tau_statistic, tau_pvalue, 
                       tau_sig, tau_zstat, tau_estimate, jonk_validity, jonk_statistic, 
                       jonk_pvalue, jonk_sig, jonk_zstat, cuzick_validity, cuzick_statistic, 
                       cuzick_pvalue, cuzick_sig, cuzick_ztest)

  
}
  
# save the results as csv sheet
write.csv(df, 'ordinalTestR.csv', row.names = FALSE)

  