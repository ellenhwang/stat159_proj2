# Section names
code = code
scripts = scripts
report = report

# in case the URL of the data changes - only one name to change
url = http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

.PHONY: all data tests eda ols ridge lasso pcr plsr regressions packages report slides session preprocess clean

MD = $(wildcard report/sections/*.Rmd)

all: eda regressions report

data: data/Credit.csv

data/Credit.csv:
	curl $(url) > $@

preprocess:
	Rscript code/$(scripts)/$@_script.R

eda:
	cd code/scripts; Rscript eda-script.R; mv eda-output.txt ../../data

ols: 
	cd code/scripts; Rscript ols-regression-script.R

pls:
	cd code/scripts; Rscript pls-regression-script.R

session:
	cd code/scripts; Rscript session-info-script.R; mv session-info.txt ../../

report: $(MD)
	cat $(MD) > report/report.Rmd
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd')"

clean:
	rm $(report)/$(report).$(rep_filetype)
