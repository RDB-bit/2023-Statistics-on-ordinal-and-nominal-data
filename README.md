# Statistics-L12023P1STAGE3-tests-for-ordinal-and-nominal-data-python-and-R

STAGE 3 Statistical tests

STAGE 1 - CHECKED - Descriptive data exploration (basically descriptive stats and general over view. First glace into the ether, trying to make sense)
STAGE 2 - CHECKED - Comprehensive data exploration, nailing rewlationships, trends and correlations where some sense emerges
STAGE 3 - this is where we are

The data set that has both ordinal and nominal DVs and ordinal and nominal IVs. Doing this tasks felt like code waltzes through the statistical realm after 3 shots of Absinthe. Most brain wracking went into test selection and running others for basic comparison. 

**METADATA EXPLANATION**

1.  RAW DATA - 20 Ordinal DVs, 36 Nominal DVs, 4 Ordinal IVs, 1 Nominal IV (this was my data) 
        1.  All IV have more than 2 groups
        2.  All Ordinal DVs have more than 2 groups
        3.  All Nominal DVs have 2 groups
2.  DATA - ran a data wrangling python script to generate 
        1.  Ordinal.xlsx, with combination of each Ordinal DV to each IV (each sheet with one combination)
        2.  Nominal.xlsx, with combination of each Nominal DV to each IV (each sheet with one combination)
        3.  Added ranking columns whilst generating the work-ready data
    This helped split the scripts vastly related to tests for either Ordinal or Nominal data 
    This helped reduce data cleaning and wrangling code for further processes
3.  SampleData - Sample datasheet shared

**TEST SELECTION**

Independent | Dependent Variable | Group | Tests                                                      
Ordinal | Ordinal | > 2, > 2  |  Linear to Linear (Ordinal Chi2 test), Kendalltau,Jonckheere–Terpstra, Cuzick tests                    
Ordinal | Nominal | > 2, = 2  |                                                                                  
Nominal | Ordinal | > 2, > 2  |  Kruskal Wallis  
Nominal | Nominal | > 2, = 2  |  Chi square for association    

**CODE LANGUAGES**
1. Python - data exploration and wrangling
2. R - somethings are better left to R ( Few Statistical tests) 
