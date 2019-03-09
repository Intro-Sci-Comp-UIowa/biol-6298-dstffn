# Reference
Tabet, Ricardos et al. “Fragile X Mental Retardation Protein (FMRP) controls diacylglycerol
kinase activity in neurons” Proceedings of the National Academy of Sciences of the United
States of America vol. 113,26 (2016): E3619-28.

# Intro
The Fragile X Mental Retardation Protein (FMRP), and RNA binding protein, has been associated with
many neurological conditions including, Fragile X syndrome, intellectual disabilities, Parkinson’s disease, as well
as autism spectrum disorder [1]. As it is the most prevalent inheritable cause for intellectual disability and
autism, it merits investigation of the mechanism through which FMRP regulates neural circuit formation. While
many studies suggest that FMRPs activity is not limited to one location or function within neurons, one major
aspect of FMRP is its role as a regulator of translation of synaptic proteins involved in negative regulation of
translation of mRNA at post-synaptic sites [2,3]. In this paper, Tabet et al. [4], the authors aim to understand
through what mechanisms FMRP regulates synaptic plasticity, by investigating what mRNA species are
interacting with FRMP in post-synaptic densities. The authors used a CLIP (cross-linking immunoprecipitation)
approach to find what mRNAs are associating with the FMRP protein in dissociated neuronal cultures.
Enrichment for mRNA from pull-downs were established through microarray analysis

# Figure link
!(https://www.ncbi.nlm.nih.gov/core/lw/2.0/html/tileshop_pmc/tileshop_pmc_inline.html?title=Click%20on%20image%20to%20zoom&p=PMC3&id=4932937_pnas.1522631113fig01.jpg)

# Figure Discription
FMRP mostly targets Dgkκ mRNA in murine cortical
neurons. (A) Volcano plot representation of the
FMRP CLIP-microarray results. The x axis is log2 of
fold change of average intensity for each individual
immunoprecipitated samples relative to Fmr1
The y axis is −log(P value) with P value determined
by using the significance analysis of microarrays
test (Materials and Methods) with n = 5 (i.e., one
microarray per independent CLIP experiment per
biological replicate). The name of a few mRNAs
with high P value or previously proposed as targets
is given, and the arbitrary 0.05 P value thresholds
with corresponding number of genes are shown. 

# Project Outline
_Goal is to create a tool to analyze microarray data reproducible enough to look at microarray
data of other RNA binding proteins in future_


# Ouline of Methods
## Data Acquision
Data for this COSMOS 2019 project was gathered from, Tabet ey al., 2016 (Gene Expression Omnibus Sereies GSE51649). This data was generated in order to establish the role of FMRP portein in translocation of neuronal mRNAs synaptic structures. In this study mRNAs were collected from FMRP using cross-linking immunoprecipitation and microarray (CLIP-microarray). RNA was collected from 10 seperate primary cortical cultures (5 from control cultures, and another 5 from FRM1-KO cultures, each of which were used to create an CLIP and INPUT sample for microarray analysis).https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE51649

## Processing and normalization of Raw Data
Prosessing and normalization of raw data (CEL files) will be completed using "R" and "R studio". Bioconducter and related packages will need to be installed (affy, oligo, and limma)
  #install bioconducter
  source("http://bioconducter.org/biocLite.R"
  
  #Install bioconducter packages (depends on if these data were conducted on an newer or older Affymetrix Array) 
  biocLite("affy")
  biocLite("oligo")
  biocLite("lima")
  
  #Load "oligo" library 
  library(oligo)

  #Read in the CEl files into the R directory
  celFiles <- list.celfiles()
  affyRaw <-read.celfiles(celFiles)
  
 #Normalize CEL data using RMA
 library(pd.mogene.1.0.st.v1)
 eset<-rma(affyRaw)
 
 #save output as a csv file to create figure (this data will be normalized and log2 transformed)
 write.exprs(eset,file="data.txt)

## Gene Annotation of normalized and Log2transformed results 
I will also utilize the bioconducter packages using R to annotate my normalized data. This is an impiortant step which will allow me to join my expression data to the gene names they belong to. I will have to use the older version of the package as this analysis was completed on a older mouse gene 1.0 array. After gene annotation is complete I will merge the data frames together in order to then calculate the p-value for my differentially expressed genes

## Calculation of P-Value and from merged gene expression data. 
I will use R studio, to determine the p-value of the change in gene expression from all genes found from the microarray data. this will be completed. Each value from the 5 different samples will be compared to ther5 control samples using an unpaired t-test. these vlues will be merged into a new data file, this file will then contain all the components needed rto create the volcano plot (Gene-Name, log2fold-change, and the p-value). 

## Figure Creation using volcano plot
I will then use R studio to then create my volcano plot. I will need to install ggplot2 for the volcano plot package. This package allows the user to define multiple aspects of the vocano plot, including aspects that I will need to improve upon the previous volcano plot, including adding gene names for the top gene hits. I will also be able to better show genes that are fall into multiple statistical catagories using colors to denote genes that have a significant p-value, but not a log fold-change 2. the complement, genes that have a log-fold change of 2 or greater, but not a significant p-value, as well as genes that have both of these criteria met. 

