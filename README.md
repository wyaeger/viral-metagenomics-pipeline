# viral-metagenomics-pipeline
Set of shell scripts run on the Charlie HPCC (https://charlie.bigelow.org/) to assemble and pull out viral contigs from a large file of raw metagenomic reads.
------
Pipeline Overview:
------
1. QC of raw metagenomic reads. Tool: FastQC (will-1umb-fastqc.sh)
2. Illumina adapter trimming. Tool: Trimmomatic (will-1umb-trimmomatic.sh)
3. Check quality using FastQC again to make sure Trimmomatic worked
4. Removal of spike-ins/synthetic molecules. Tool: BBDuk, part of BBMap module (will-1umb-bbduk.sh)
5. Decontamination (removal of human, mouse, cat, and dog DNA). Tool: BBSplit, part of BBMap module (will-1umb-bbsplit.sh)
6. (optional) Subsampling of cleaned reads before assembly––done in this case (at 10%) because of the massive file size. Tool: Reformat, part of BBMap module (will-1umb-reformat.sh)
----
8. Contig and scaffold assembly and isolation of viral contigs. Tool: metaviralSPAdes, part of SPAdes module (will-1umb-metaviralspades.sh)
9. Contig and scaffold assembly for complete metagenome (viral contigs and also the bacteria/eukaryotes in the dataset). Tool: metaSPAdes, part of SPAdes module (will-1umb-metaspades.sh)
-------
(steps after this are done independently for both of the assemblies created in steps 8 and 9 above)
------
10. Read mapping back to assembly in order to generate coverage map. Tool: BBMap (will-1umb-bbmap.sh)
11. SAM to BAM conversion and BAM sorting. Tool: SAMtools (will-1umb-samtools.sh)
12. Metagenome binning (consolidating contigs that are part of the same genome) using MetaBAT (will-1umb-bbmap.sh)
-----
13. Check genome completeness + get some taxonomic information. Tool: CheckV
14. Host prediction:
      a. BLAST the contigs and look at E-values for various hosts––if good, it may be a match.  
      b. VPF-class (also does taxonomic assignment)   
      c. DStar2?  
      d. Host taxon predictor?      
15. Annotation (which can help with taxonomy). Tool: DRAMv

