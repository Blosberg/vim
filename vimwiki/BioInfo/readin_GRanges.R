
# This is how NOT to read in a bed file to GRanges -- it leaves the incorrect (base0) notation in at the start site
# you have to add one to the start values

library(GenomicRanges)
library(bedtoolsr)

gr_a  = GRanges(as.data.frame( read.table( "example_dataFiles/a.bed",
                                             comment.char = "@",
                                             header=TRUE,
                                             sep="\t",
                                             stringsAsFactors=FALSE,
                                             quote="")))

gr_b  = GRanges(as.data.frame( read.table( "example_dataFiles/b.bed",
                                             comment.char = "@",
                                             header=TRUE,
                                             sep="\t",
                                             stringsAsFactors=FALSE,
                                             quote="")))

= rtracklayer =
do this:
DMRs_tmp = rtracklayer::import.bedGraph( con=DMR_bed_files[Di] )
rtracklayer::export.bedGraph(DMRs_gr,  con =  DMRpermute_Ranges )

= as table =

# This works if you know you've set up your input file in non-bed format, like:
# chr1:15-50 	val1 	val2
# chr2:50-100	val1	val2
# etc...
# ^ base-1 is implied here, whereas bedfiles use base-0 for the start position.

Raw_refdat = read.csv( Sigmat_biomarkers,
                       sep="\t",
                       header = TRUE )

#Biomarkers, in GRanges format:
refdat$biom_GR = as( as.character(Raw_refdat[,1]), "GRanges");

