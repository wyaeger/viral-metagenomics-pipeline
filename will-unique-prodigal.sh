#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N will-prodigal                                                             

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
#PBS -e /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/uniquevirus_prodigal
#PBS -o /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/uniquevirus_prodigal

## jobs to submit  

module use /mod/scgc
module load prodigal/2.6.2
module load anaconda3/

cd /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/uniquevirus_prodigal

prodigal -i /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/unique_assemblies/unique_viral/scaffolds.fasta -o genes.gff -a proteins.faa -d mrna.fasta -p meta


## input file: scaffold from unique viral metagenome: /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/unique_assemblies/unique_viral/scaffolds.fasta


