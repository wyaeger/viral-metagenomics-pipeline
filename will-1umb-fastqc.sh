#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N will-fastqc                                                             

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 4 hours                        
#PBS -l walltime=04:00:00 

## use 1 compute node and 4 cpu                                                       
#PBS -l select=1:ncpus=4:mem=4GB    

#PBS -m bea

#PBS -M why223@lehigh.edu
                                                              
## output files placed in output directory in the user vcc’s home directory                                     
#PBS -e /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/fastqc_1uMB
#PBS -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/fastqc_1uMB                                                        

## jobs to submit  
                                                       
module use /mod/scgc
module load fastqc/
module load anaconda3/

cd /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/fastqc_1uMB

fastqc /mnt/homefs/wyaeger/1umb_2_RP.fq.gz /mnt/homefs/wyaeger/1umb_2_FP.fq.gz -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/fastqc_1uMB
