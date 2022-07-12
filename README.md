# viral-metagenomics-pipeline
Set of shell scripts run on the Charlie HPCC (https://charlie.bigelow.org/) to assemble and pull out viral contigs from a large file of raw metagenomic reads.

Pipeline Overview:
1. QC of raw metagenomic reads. Tool: FastQC (will-1umb-fastqc.sh)
2. Illumina adapter trimming. Tool: Trimmomatic (will-1umb-trimmomatic.sh)
3. Check quality using FastQC again to make sure Trimmomatic worked
4. Removal of spike-ins/synthetic molecules. Tool: BBDuk, part of BBMap module (will-1umb-bbduk.sh)
5. Decontamination (removal of human, mouse, cat, and dog DNA). Tool: BBSplit, part of BBMap module (will-1umb-bbsplit.sh)
6. (optional) Subsampling of cleaned reads before assembly––done in this case (at 10%) because of the massive file size. Tool: Reformat, part of BBMap module (will-1umb-reformat.sh)
7. Scaffold assembly and isolation of viral contigs. Tool: metaviralSPAdes, part of SPAdes module (will-1umb-metaviralspades.sh)
