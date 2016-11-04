# Section names
code = code
scripts = code/scripts
report = report

# in case the URL of the data changes - only one name to change
url = http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

.PHONY: all data tests eda ols ridge lasso pcr pls regressions report slides session preprocess clean

MD = $(wildcard report/sections/*.Rmd)

all: eda regressions report

data: data/Credit.csv

data/Credit.csv:
	curl $(url) > $@

preprocess:
	Rscript $(scripts)/$@-script.R

eda:
	Rscript $(scripts)/$@-script.R

ols:
	Rscript $(scripts)/$@-regression-script.R

pls:
	Rscript $(scripts)/$@-regression-script.R

pcr:
	Rscript $(scripts)/$@-regression-script.R

lasso:
	Rscript $(scripts)/$@-regression-script.R

ridge:
	Rscript $(scripts)/$@-regression-script.R

regressions: ols ridge lasso pcr pls

session:
	Rscript $(scripts)/$@-info-script.R

report: $(MD)
	cat $(MD) > report/report.Rmd
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd')"

clean:
	rm $(report)/$(report).$(rep_filetype)
