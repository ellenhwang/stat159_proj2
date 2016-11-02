# Section names
code = code
scripts = scripts
report = report

# in case the URL of the data changes - only one name to change
url = http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

.PHONY: all data tests eda ols ridge lasso pcr plsr regressions packages report slides session preprocess clean

all: eda regressions report

data: data/Credit.csv

data/Credit.csv:
	curl $(url) > $@

preprocess:
	Rscript code/$(scripts)/$@_script.R

clean:
	rm $(report)/$(report).$(rep_filetype)
