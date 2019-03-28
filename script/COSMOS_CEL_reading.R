# This script will be used to create the CSV file which will contain gene names, logfold change values, p-values, and adj. p-vlaiues 


## In order to run this script you will need to install these other R packages 
### Matrix, lattics, fdrtool, and rpart 

#This script also uses Bioconductor, and other Bioconducter packages (oligo, limma, Biobase, Biostrings, genefilter)

###############################################################################################################################

### Opening the CEL files using affy ###

# set the path of the CEL files for your computer
celpath = "your path here"

# import CEL files raw probe-level data as a R AffyBatch object 
data = ReadAffy(celfile.path=celpath)

# data is now an Affybatch object which contains the data from your CEL files 


