# viral-metagenomics-pipeline
Set of scripts run on Charlie (https://charlie.bigelow.org/) to assemble and pull out viral contigs from a large file of raw metagenomic reads

Pipeline Overview:
1. QC of raw metagenomic reads using FastQC (will-1umb-fastqc.sh)
2. Adapter trimming using Trimmomatic (will-1umb-trimmomatic.sh)
[2.5. Check with FastQC again to make sure Trimmomatic worked]
3. Removal of spike-ins/synthetic molecules using BBDuk (will-1umb-bbduk.sh)
4. Decontamination (removal of human, mouse, cat, and dog DNA) using BBSplit (will-1umb-bbsplit.sh)
5. Scaffold assembly and isolation of viral contigs using metaviralSPAdes (pending; will-1umb-metaviralspades.sh)
