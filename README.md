# viral-metagenomics-pipeline
Set of scripts used to get individual viral genomes from a large file of raw metagenomic reads

Pipeline:
- QC using FastQC
- Adapter trimming using Trimmomatic
- Removal of synthetic molecules using BBDuk
- Decontamination (removal of human, mouse, cat, and dog DNA) using BBSplit
- Genome assembly using metaSPAdes
