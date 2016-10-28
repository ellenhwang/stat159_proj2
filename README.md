# Stat159 Project 2

## Authors

Ellen Hwang and Joseph Simonian

## Steps

1. git clone the repository
2. `cd` into directory
3. run `make all` to execute all scripts and get all output

## File Structure

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
│   │   eda-output.txt                  # produced by eda-script.R
│
└───code
│   │   README.md
│   │   
│   └───scripts
│   │   │   eda-script.R
│   │   │   ols-script.R
│   │   │   ridge-script.R
│   │   │   lasso-script.R
│   │   │   pcr-script.R
│   │   │   plsr-script.R
│   │   │   session-info-script.R
│   │
│   └───functions
│   │   │   regression-functions.R
│   │
│   └───tests
│   │   │   test-regression.R
│
└───images
│   │   README.md
│   │   histogram-sales.png            # produced by eda-script.R
│
└───report
    │   README.md
    │   report.Rmd
    │   report.pdf

1. code: includes functions, scripts, and tests
2. data: includes `Credit.csv` dataset used
3. images: includes all visualizations of the data
4. report: various file versions of the report and sections

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
