#!/bin/bash
#SBATCH --job-name=repeat_modeler_clean1
#SBATCH --partition=highmem_p
#SBATCH --ntasks=32
#SBATCH --mem=300gb
#SBATCH --time=160:00:00
#SBATCH --output=repeat_modeler2_clean.out
#SBATCH --error=repeat_modeler2_clean.err

# script modified from (PBentz 30 NOV 2023)

# path to genome assembly fasta file (not masked)
fasta="/scratch/srb67793/GenomeAssembly_Spr2025/Results/FCS/G_maculatum_BF73-hap2-JBAT.FINAL.clean.fa"

# name you want to use for repeat databse (e.g., a species code, specimen ID, etc.)
rep_base='G_maculatum_1663611_BF73_hap2'

# load RepeatModeler
ml RepeatModeler

# make a directory for storing logs
mkdir -p logs

# build new RepeatModeler BLAST database
BuildDatabase -name $rep_base -engine ncbi $fasta

# now run RepeatModeler 
RepeatModeler -threads 32 -engine ncbi -database $rep_base 2>&1 | tee 00_repeatmodeler.log

#32 cores
#results from STDOUT and STDERR streams to 1_repeatmodeler.log
