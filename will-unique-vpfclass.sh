#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N will-vpfclass                                                             

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 48 hours                        
#PBS -l walltime=48:00:00 

## use 1 compute node and 16 cpu                                                       
#PBS -l select=1:ncpus=16:mem=50GB  

#PBS -m bea
#PBS -M why223@lehigh.edu
                                                              
## output files placed in output directory in the user vcc’s home directory                                     
#PBS -e /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/unique_vpfclass
#PBS -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/unique_vpfclass

## jobs to submit  

module load vpftools

cd /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/unique_vpfclass

vpf-class --data-index /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/vpf-class-data/index.yaml -i /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/unique_assemblies/unique_viral/scaffolds.fasta -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/unique_vpfclass

##  Usage: vpf-class --data-index DATA_INDEX (-i|--input-seqs SEQS_FILE)
##                 (-o|--output-dir OUTPUT_DIR)
##  Classify virus sequences using an existing VPF classification


##  Note: index.yaml file is required for vpf-class to run (can be downloaded from the program's GitHub project)


