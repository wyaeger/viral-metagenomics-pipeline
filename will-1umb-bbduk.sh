#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N will-bbduk                                                             

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 8 hours                        
#PBS -l walltime=08:00:00 

## use 1 compute node and 4 cpu                                                       
#PBS -l select=1:ncpus=4:mem=4GB    

#PBS -m bea

#PBS -M why223@lehigh.edu
                                                              
## output files placed in output directory in the user vcc’s home directory                                     
#PBS -e /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis
#PBS -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis

## jobs to submit  
                                                       
module use /mod/scgc
module load bbmap/
module load anaconda3/

cd /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis

bbduk.sh in1=/home/wyaeger/1umb_2_RP.fq.gz in2=/home/wyaeger/1umb_2_FP.fq.gz out1=1umb_2_R_filtered.fq.gz out2=1umb_2_F_filtered.fq.gz outm1=1umb_2_R_matched.fq.gz outm2=1umb_2_F_matched.fq.gz ref=/mnt/scgc_nfs/opt/common/bbmap/35.85/resources/phix174_ill.ref.fa.gz k=31 hdist=1 stats=stats.txt

## what I want to do:
##      - run bbduk on my files.
##          - inputs:
##              sftp://cfe.bigelow.org/home/wyaeger/1umb_2_RP.fq.gz
##              sftp://cfe.bigelow.org/home/wyaeger/1umb_2_FP.fq.gz

##          - specific operation is Kmer filtering (example code below):
##              bbduk.sh in=reads.fq out=unmatched.fq outm=matched.fq ref=phix.fa k=31 hdist=1 stats=stats.txt
##              (This will remove all reads that have a 31-mer match to PhiX (a common Illumina spikein, which is included in /bbmap/resources/), allowing one mismatch. The “outm” stream will catch reads that matched a reference kmers. This allows you to split a set of reads based on the presence of something. “stats” will produce a report of which contaminant sequences were seen, and how many reads had them)