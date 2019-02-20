# reference: Tabet, Ricardos et al. “Fragile X Mental Retardation Protein (FMRP) controls diacylglycerol
kinase activity in neurons” Proceedings of the National Academy of Sciences of the United
States of America vol. 113,26 (2016): E3619-28.

# Intro: The Fragile X Mental Retardation Protein (FMRP), and RNA binding protein, has been associated with
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

# Figure link:  https://www.ncbi.nlm.nih.gov/core/lw/2.0/html/tileshop_pmc/tileshop_pmc_inline.html?title=Click%20on%20image%20to%20zoom&p=PMC3&id=4932937_pnas.1522631113fig01.jpg

# Figure Discription:FMRP mostly targets Dgkκ mRNA in murine cortical
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

# Project Outline: (Goal is to create a tool to analyze microarray data reproducible enough to look at microarray
data of other RNA binding proteins in future)
1) Get Microarray data from GSE51649
2) Combine Microarray replicate values by condition (WT:INPUT, WT:IP, KO:INPUT, KO:IP) Unix (sed or
awk, maybe perl) intermediate output file for QC
3) Average Columns of replicate values per condition Unix
4) Concatenate CSVs to Masterfile Unix
5) Stats: Using R script for each gene calculate fold change 
6) Figure: Using R script create volcano plot with changes noted above (QC: open JPG of figure) 
