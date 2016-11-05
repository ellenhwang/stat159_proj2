# Stat159 Project 2

## Authors

Ellen Hwang and Joseph Simonian

## Steps

1. git clone the repository
2. `cd` into directory
3. run `make all` to execute all scripts and get all output

## File Structure
```
project
│   .gitignore
|   LICENSE
│   README.md
│   Makefile
│   session-info.txt                    # produced by session-info-script.R
│
└───data
│   │   README.md
│   │   Credit.csv
│   │   Processed_Credit.csv
│   │   test.csv
│   │   train.csv
│   │   eda-output.txt                  # produced by eda-script.R
│   │   lasso-objects.RData
│   │   lasso-output.txt
│   │   ols-regression.RData
│   │   pcr-objects.RData
│   │   pcr-output.txt
│   │   pls-objects.RData
│   │   pls-output.txt
│   │   ridge-objects.RData
│   │   ridge-output.txt
│
└───code
│   │   README.md
│   │   test-that.R
│   │   
│   └───scripts
│   │   │   eda-script.R
│   │   │   ols-regression-script.R
│   │   │   ridge-regression-script.R
│   │   │   lasso-regression-script.R
│   │   │   pcr-regression-script.R
│   │   │   pls-regression-script.R
|   |   |   preprocess-script.R
│   │   │   session-info-script.R
│   │
│   └───functions
│   │   │   regression-functions.R
│   │   │   statistic-functions.R
│   │
│   └───testsg
│   │   │   test-regression.R
│   │   │   test-statistic.R
│
└───images
│   │   README.md
│   │   boxplot-balance-ethnicity.png
│   │   boxplot-balance-gender.png
│   │   boxplot-balance-married.png
│   │   boxplot-balance-student.png
│   │   histogram-credit-age.png
│   │   histogram-credit-income.png
│   │   histogram-credit-limit.png
│   │   histogram-credit-rating.png
│   │   lasso-cross-valid-errors.png
│   │   pcr-cross-valid-errors.png
│   │   pls-cross-valid-errors.png
│   │   ridge-cross-valid-errors.png
│
└───report
    │   README.md
    │   report.Rmd
    │   report.pdf
```

1. code: includes functions, scripts, and tests
2. data: includes `Credit.csv` dataset used
3. images: includes all visualizations of the data
4. report: various file versions of the report and sections

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
