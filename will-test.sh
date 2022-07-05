#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N test                                                             

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 10 min                    
#PBS -l walltime=00:10:00 

## use 1 compute node and 1 cpu                                                       
#PBS -l select=1:ncpus=1:mem=8GB    

#PBS -m bea

#PBS -M why223@lehigh.edu
                                                              
## output files placed in output directory in the user vcc’s home directory                                                                                              
#PBS -e /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/fastqc_1uMB
#PBS -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/fastqc_1uMB 

## jobs to submit 

echo start
echo this is a test
/bin/sleep 10
echo finished
