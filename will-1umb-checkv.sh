#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N will-checkv                                                             

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 120 hours                        
#PBS -l walltime=120:00:00 

## use 1 compute node and 16 cpu                                                       
#PBS -l select=1:ncpus=16:mem=500GB  

#PBS -m bea
#PBS -M why223@lehigh.edu
                                                              
## output files placed in output directory in the user vcc’s home directory                                     
#PBS -e /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis
#PBS -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis

## jobs to submit  

##  for some reason this only works if you install the checkv viral reference database to your home directory first. In Terminal, run the following:
##      module use /mod/bigelow
##      module load checkv/0.9.0
##      checkv download_database ~/
##      export CHECKVDB=~/checkv-db-v1.2
##  then try submitting this script.


module use /mod/bigelow
module load checkv/0.9.0
module load anaconda3/

cd /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis

checkv end_to_end /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/metaspades_1umb/scaffolds.fasta /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/checkv -t 16