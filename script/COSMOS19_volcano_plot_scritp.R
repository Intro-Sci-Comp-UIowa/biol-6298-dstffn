## Volcano Plot R-Studio Script 

res <- Dataset1

# Make a basic volcano plot
with(res, plot(logFC, -log10(FDR), pch=20, main="LogFC vs FDR Volcano Plot of RNA Seq Data", xlim=c(-2.5,2)))

# Add colored points: red if F<0.05, orange of log2FC>1, green if both)
with(subset(res, FDR>.05 ), points(logFC, -log10(FDR), pch=20, col="grey"))
#with(subset(res, abs(logFC)>1), points(logFC, -log10(FDR), pch=20, col="black"))
# this uses another column in which I added yes and no for those 
with(subset(res, tub == 'yes'), points(logFC, -log10(FDR), pch=20, col="red"))



# Label points with the textxy function from the calibrate plot
#library(calibrate)
#with(subset(res, FDR<.05 & abs(logFC)>1), textxy(logFC, -log10(FDR), labs=symbol, cex=.6))

