#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N trimmomatic

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
#PBS -e /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/trimmomatic_1umB
#PBS -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/trimmomatic_1umB

##jobs to submit

echo start

module use /mod/scgc
module load trimmomatic
module load anaconda3/

## Note- cannot write to storage folder bc bigelow has funky permissions, must write to home and copy later, annoying. 

trimmomatic.sh PE -phred33 /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Ch_1_metagenomes/1uMB/T216_1B_FSFP220068773-1a_HWYGVDSX2_L1_1.fq.gz /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Ch_1_metagenomes/1uMB/T216_1B_FSFP220068773-1a_HWYGVDSX2_L1_2.fq.gz \
1umb_2_FP.fq.gz 1umb_2_FUP.fq.gz \
1umb_2_RP.fq.gz 1umb_2_RUPfq.gz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:0 TRAILING:5 SLIDINGWINDOW:4:15 MINLEN:36

/bin/sleep 10
echo finished