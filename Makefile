# Section names
code = code
scripts = scripts
report = report

# in case the URL of the data changes - only one name to change
url = http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

.PHONY: all data tests eda ols ridge lasso pcr plsr regressions packages report slides session clean

all: eda regressions report

data: data/Credit.csv

data/Credit.csv:
	curl $(url) > $@

eda:
	cd code/scripts; Rscript eda-script.R; mv eda-output.txt ../../data

clean:
	rm $(report)/$(report).$(rep_filetype)
