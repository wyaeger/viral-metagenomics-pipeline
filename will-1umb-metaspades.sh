#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N will-metaspades                                                             

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 48 hours                        
#PBS -l walltime=48:00:00 

## use 1 compute node and 190 cpu                                                       
#PBS -l select=1:ncpus=190:mem=1000GB  

#PBS -m bea
#PBS -M why223@lehigh.edu
                                                              
## output files placed in output directory in the user vcc’s home directory                                     
#PBS -e /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis
#PBS -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis

## jobs to submit  

module use /mod/bigelow
module load spades/3.15.4
module load anaconda3/

cd /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis

spades.py --memory 1000 --meta -1 /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/bbsplit_outputs/cleanF.fq.gz -2 /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/bbsplit_outputs/cleanR.fq.gz -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/metaspades_1umb
echo start
/bin/sleep 10
echo finished