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
[![figure](https://www.pnas.org/content/pnas/113/26/E3619/F1.large.jpg)](https://www.ncbi.nlm.nih.gov/core/lw/2.0/html/tileshop_pmc/tileshop_pmc_inline.html?title=Click%20on%20image%20to%20zoom&p=PMC3&id=4932937_pnas.1522631113fig01.jpg)

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

Preliminary Data
Quality Control of Microarray Raw Data 
First, raw data (CEL files) were downloaded from the GEO repository as mentioned above. Raw micro array was processed and assessed for quality of probe intensity acquisition using Transcript Analysis Counsel, a free program available for download from Affymetrix. Quality of Raw data was analyses through multiple means (Fig. 1). Box and Whisker plots show an average higher intensity for the CLIP samples, as compared to the Input samples showing that their CLIP-pull down experiments were able to successfully gather RNA-Protein interactions. I next ran a principle component analysis to investigate the variability from each sample (Fig. 2.) This analysis allows to look for general variations and tends within data sets. Principle component analysis of data from the microarray data showed distinct separation from different sample types, also indicating that their sample preparation and CLIP experiments were successful.


# Preliminary Figure and Future Steps 

After QC analysis of the raw microarray data was completed I next normalized the data using the Bioconductor package ‘oligo’ in R studio. This package is used for Affymetrix chips that are more current than chips that in which the ‘affy’ R package would be used. After the data was normalized, logFold changes in probe intensity and p-values were calculated, using the methods mentioned above, using R and excel (Still working out the kinks in my R program, as I am having trouble using packages from multiple versions of R). While my p-values are close to what the paper has in their supplementary information, they are not the exact same so I will have to figure out what are the adjustments they used when running their statistical analysis. I then, using the data I was able to generate was able to create a rough volcano plot using the logfold change and the p-value from each gene, shown in Figure 3. While this figure is very rough, it does look like I have the same general shape to the volcano plot as in the original figure. However, I still have plenty of work to do including marking specific genes of interest, marking genes based on their p-value or change in logfold change (i.e. for genes that are under a p-value of .05, and a log fold change greater than 2 or -2. I have also am having trouble changing the scope of the graph, as I would like to expand the graph to show an equal amount on both sides of the X axis, right now my code is not allowing me to do that. While my current graph does not currently have gene names labeled (currently in progress). The graph is very similar in change and the major RNA species that was identified in the paper, Dgkk is found at the same location on this graph showing that my analysis also shows that the RNA binding protein FRMP interacts with Dgkk in the mouse cortex. 

#  Discussion 

While I feel that I have made a decent amount of progress to the completion of my reanalysis of this FMRP CLIP-microarray analysis data, there have been many aspects of my plan that have not gone as expected. While Affymetrix has its own free software for the interpretation of microarray analysis, I wanted to create an R script that could be a more robust option to go straight from CEL files to the volcano plot, however this has come with many issues that I am still working on. Using biocondutor packages on R I am finding that they do not all work for the same specific arrays. The older arrays cannot use the package “oligo” and use the package “affy” instead, I have found that these packages use different versions of R which has been incredibly difficult to deal with as scripts that I have run will work, but when I need to change my R version to 3.5, I found that the previous code was not able to work anymore. However, as I work on this issue in the future, I will figure out how to get my code working specifically in the R version 3.5. 
While this paper has provided the CEL files, which allow for the data to be used my many more investigators, reproducing their data has been a little more difficult than I first intended. Specifically, I feel that the article does not provide enough information on how the adjusted p-value was calculated. Since this CLIP experiment has two different animals being analyzed FRMP-KO and WT. both with Pull-down samples and their own input samples, calculating an adjusted p-value can be done in different ways, some more correct than others. While the paper does provide a reference as how they calculated the p-value, the reference they showed is a paper includes multiple ways to calculate p-values from microarray data, and therefore there is no clear explanation on how to run their stats again to obtain their p-values again. However, the numbers I have gotten seem to be close, but more investigation 

