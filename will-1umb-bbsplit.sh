#!/bin/bash                                                                     

## set name of script                                                           
#PBS -N will-bbsplit                                                            

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 36 hours                        
#PBS -l walltime=36:00:00 

## use 1 compute node and 4 cpu                                                       
#PBS -l select=1:ncpus=4:mem=1000GB    

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

bbsplit.sh -Xmx1000g in1=/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/bbduk_outputs/1umb_2_F_filtered.fq.gz in2=/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/bbduk_outputs/1umb_2_R_filtered.fq.gz ref=/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Contaminant_reference_sequences/mouse_masked.fa.gz,/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Contaminant_reference_sequences/hg19_main_mask_ribo_animal_allplant_allfungus.fa.gz,/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Contaminant_reference_sequences/dog_masked.fa.gz,/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Contaminant_reference_sequences/dog_masked.fa.gz,/mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Contaminant_reference_sequences/cat_masked.fa.gz basename=out_%.fq.gz outu1=cleanF.fq.gz outu2=cleanR.fq.gz

##input filepaths:
##  /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/bbduk_outputs/1umb_2_F_filtered.fq.gz
##  /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/WYaeger/analysis/bbduk_outputs/1umb_2_R_filtered.fq.gz

##contaminant reference genome filepaths:
##  /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Contaminant_reference_sequences/mouse_masked.fa.gz
##  /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Contaminant_reference_sequences/hg19_main_mask_ribo_animal_allplant_allfungus.fa.gz
##  /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Contaminant_reference_sequences/dog_masked.fa.gz
##  /mnt/storage/labs/martinez_nfs/ECOHAB_Kb_virus/Data/Contaminant_reference_sequences/cat_masked.fa.gz

## alternative method to try if above doesn't work (can maybe only use one reference at a time with this):
##  index reference (contaminant genome):
##      bbmap.sh ref=hg19_main_mask_ribo_animal_allplant_allfungus.fa.gz -Xmx23g
##  map to reference:
##      bbmap.sh minid=0.95 maxindel=3 bwr=0.16 bw=12 quickmatch fast minhits=2 path=/path/to/hg19masked/ qtrim=rl trimq=10 untrim -Xmx23g in=reads.fq outu=clean.fq outm=human.fq


