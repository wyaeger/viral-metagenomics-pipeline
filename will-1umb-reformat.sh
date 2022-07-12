#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N will-reformat                                                             

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 120 hours                        
#PBS -l walltime=120:00:00 

## use 1 compute node and 10 cpu                                                       
#PBS -l select=1:ncpus=10:mem=50GB  

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

reformat.sh in1=/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/bbsplit_outputs/cleanF.fq.gz in2=/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/bbsplit_outputs/cleanR.fq.gz out1=Sampled_R1.fq.gz out2=Sampled_R2.fq.gz samplerate=0.1


##Sampling parameters:

##reads=-1                Set to a positive number to only process this many INPUT reads (or pairs), then quit.
##skipreads=-1            Skip (discard) this many INPUT reads before processing the rest.
##samplerate=1            Randomly output only this fraction of reads; 1 means sampling is disabled.
##sampleseed=-1           Set to a positive number to use that prng seed for sampling (allowing deterministic sampling).
##samplereadstarget=0     (srt) Exact number of OUTPUT reads (or pairs) desired.
##samplebasestarget=0     (sbt) Exact number of OUTPUT bases desired.
##Important: srt/sbt flags should not be used with stdin, samplerate, qtrim, minlength, or minavgquality.