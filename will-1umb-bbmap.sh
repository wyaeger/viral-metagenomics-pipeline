#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N will-bbmap                                                           

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 36 hours                        
#PBS -l walltime=36:00:00 

## use 1 compute node and 190 cpu                                                       
#PBS -l select=1:ncpus=190:mem=1000GB    

#PBS -m bea

#PBS -M why223@lehigh.edu
                                                              
## output files placed in output directory in the user vcc’s home directory                                     
#PBS -e /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/bbmap_1umb_complete
#PBS -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/bbmap_1umb_complete

## jobs to submit  
                                                       
module use /mod/scgc
module load bbmap/
module load anaconda3/

cd /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis

bbmap.sh in1=/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/subsampled_reads_10pct/Sampled_R2.fq.gz in2=/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/subsampled_reads_10pct/Sampled_R1.fq.gz ref=/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/metaspades_1umb/contigs.fasta out=mapped.sam covstats=covstats.txt covhist=covhist.txt basecov=basecov.txt bincov=bincov.txt

##module load samtools
##samtools view -bS mapped.sam > mapped.bam
##samtools sort mapped.bam -o mapped.bam


##  input filepaths:
##      /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/subsampled_reads_10pct/Sampled_R2.fq.gz
##      /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/subsampled_reads_10pct/Sampled_R1.fq.gz
##  reference (assembly):    /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/metaspades_1umb/contigs.fasta