# Statistics-L12023P1STAGE3-tests-for-ordinal-and-nominal-data-python-and-R

STAGE 3 Statistical tests

**PROJECT DESCRIPTION**
This worksheet combines statistical tests and effect size functionalities (inbuilt or personal) to demo results next to each other for better inferencing.

Usually tests are run solo, and one might forget other important statements to add to interpret tests results better. This project is an attempt to combine such insight into one place to deliver wholesome inference on data

STAGE 1 - CHECKED - Descriptive data exploration (basically descriptive stats and general over view. First glace into the ether, trying to make sense)
STAGE 2 - CHECKED - Comprehensive data exploration, nailing rewlationships, trends and correlations where some sense emerges
STAGE 3 - this is where we are

The data set that has both ordinal and nominal DVs and ordinal and nominal IVs. Doing this tasks felt like code waltzes through the statistical realm after 3 shots of Absinthe. 
Most brain wracking went into test selection and running others for basic comparison. 

**METADATA EXPLANATION**

1.  RAW DATA - 20 Ordinal DVs, 36 Nominal DVs, 4 Ordinal IVs, 1 Nominal IV
2.  DATA - ran a data wrangling python script to generate 
        1.  Ordinal.xlsx, with combination of each Ordinal DV to each IV (each sheet with one combination)
        2.  Nominal.xlsx, with combination of each Nominal DV to each IV (each sheet with one combination)
        3.  Added ranking columns whilst generating the work-ready data
    This helped split the scripts vastly related to tests for either Ordinal or Nominal data 
    This helped reduce data cleaning and wrangling code for further processes
3.  SampleData - Sample datasheet shared
4.  Ratings in SampleDataNominal are not used in anyway - they are residual of data preparation

**TEST SELECTION**

IV to DV | Group size

Ordinal to Ordinal | > 2, > 2 -> Linear to Linear (Ordinal Chi2 test), Kendalltau, Jonckheere–Terpstra, Cuzick tests
Ordinal to Nominal | > 2, = 2 -> 
Nominal to Ordinal | > 2, > 2 -> Kruskal Wallis (works on Ordinal IV too , as treats it as Nominal anyway)
Nominal to Nominal | > 2, = 2 -> Chi2

**EFFECT SIZE**

Nominal - Nominal -> Chi2 -> Cramver V [0 to 1] or phi
Ordinal - Ordinal -> Kendall tau -> tau [-1 to 1] (b and c) or Kruskal's gamma
Ordinal - Nominal -> Kruskal Wallis -> epsilon-squared [0 to 1] 
Ordinal - Nominal -> Freeman’s theta [0 to 1] or epsilon-squared [0 to 1] or eta-squared (more biased) [0 to 1]

 
**CODE AND INSTALLATION DESCRIPTION**

1.  Python - for quicker statistical tests and data wrangling
2.  R - for more advanced statistical tests not available in python. Somethings are better left to R
3.  Installation - I worked on VS Code IDE, Python 3.10.10, RStudio, R 4.3, Jupyter Notebook 
4.  Installation - Refer requirement files to install dependencies

**CODE RUN**
1.  Sample data provided, ready for the script 

**COMMUNITY CONTRIBUTION**

Thank you for considering contributing to this statistics project! I appreciate your interest in helping to improve and grow.

Ways to Contribute
There are several ways you can contribute to the project:

Bug Reports: If you come across any bugs, errors, or unexpected behavior, please report them by opening an issue. Include as much detail as possible, such as steps to reproduce the issue and any error messages or relevant information.

Feature Requests: If you have ideas for new features or enhancements, we welcome feature requests. Open an issue and describe the feature or improvement you would like to see. Explain why it would be valuable and how it aligns with the project's scope.

Documentation: Will endevour to add one in near future. If you have any ideas or areas that need improvement, please contribute by adding the documentation. You can submit a pull request with your proposed changes.

Code Contributions: If you're interested in improving the project's codebase, you can contribute by fixing bugs, optimizing performance, or implementing new features. Fork the repository, make your changes in a new branch, and submit a pull request with a clear description of the changes and their purpose.


**GETTING STARTED**
To get started with contributing, follow these steps:

1.  Fork the repository to your own GitHub account.
2.  Clone the forked repository to your local machine.
3.  Create a new branch for your contributions.
4.  Make the necessary changes and additions.
5.  Test your changes thoroughly.
6.  Commit your changes with descriptive commit messages.
7.  Push the changes to your forked repository.
8.  Submit a pull request to the main repository.

Truely appreciate your time and effort in contributing to the project. The team will review your contributions as soon as possible and provide feedback or merge them into the main project.

Once again, thank you for your contributions and for helping us make this statistics project even better! 


