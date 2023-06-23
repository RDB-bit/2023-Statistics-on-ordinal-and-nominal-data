sheet_names <- excel_sheets("combinations.xlsx")

# prepare empty data frame
column_names <- c("IV", "DV", "JT statistic", 
                  "JT p value", "JT significance", "JT z stat",
                  "Cuzick statistic", "Cuzick p value", 
                  "Cuzick significance", "Cuzick z stat")

df = data.frame(matrix(nrow = 0, ncol = length(column_names)))
colnames(df) <- column_names


for (sheet in sheet_names){
  
  
  # read the data in one worksheet
  data <- read_excel("combinations.xlsx", sheet = sheet)
  
  # convert into a table for the tests to read
  tab_temp <- table(data$`Rating IV`, data$`Rating DV`)
  

  if (((colnames(data)[1] == "7-43-5") || (colnames(data)[1] == "5-22-5")) || ((grepl("4-18", colnames(data)[2]) == TRUE) || (grepl("4-19", colnames(data)[2]) == TRUE) || (grepl("5-22", colnames(data)[2]) == TRUE) || (grepl("6-38", colnames(data)[2]) == TRUE))){ 
    
    print('skipping')

  } else{
    
    print(sheet)
    
    # jonckheere test
    test <- jonckheereTest(data$`Rating IV`, data$`Rating DV`)
    jonk_statistic <-test$estimates
    jonk_pvalue <- test$p.value
    jonk_sig <- if (jonk_pvalue < 0.05) "significant" else "not significant"
    jonk_zstat <- test$statistic
    
    # cuzick test
    test <- cuzickTest(data$`Rating IV`, data$`Rating DV`)
    cuzick_statistic <-test$estimate
    cuzick_pvalue <- test$p.value
    cuzick_sig <- if (cuzick_pvalue < 0.05) "significant" else "not significant"
    cuzick_ztest <- test$statistic
    

  }
  

  #df <- rbind(df, result)
  df[nrow(df)+1,] <- c(as.character(colnames(data)[1]), as.character(colnames(data)[2]), jonk_statistic, jonk_pvalue, jonk_sig, jonk_zstat, 
                       cuzick_statistic, cuzick_pvalue, cuzick_sig, cuzick_ztest)

  
}
  
# save the results as csv sheet
write.csv(df, 'ordinalTest2R.csv', row.names = FALSE)

  