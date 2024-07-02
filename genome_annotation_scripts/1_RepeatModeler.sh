#!/bin/bash
#SBATCH --job-name=repeat_modeler_clean2
#SBATCH --partition=highmem_p
#SBATCH --ntasks=32
#SBATCH --mem=300gb
#SBATCH --time=160:00:00
#SBATCH --output=repeat_modeler2_clean.out
#SBATCH --error=repeat_modeler2_clean.err

# script by PBentz 30 NOV 2023

## name variables:
# path to genome assembly fasta file (does not need to be masked)
fasta='/scratch/srb67793/Geranium/Results/FCS/G_maculatum_BF73.asm.hap2.clean.fasta '
# name you want to use for repeat databse (e.g., a species code, specimen ID, etc.)
rep_base='G_maculatum_BF73_hap2_cleaned'

## somewhat following https://darencard.net/blog/2022-07-09-genome-repeat-annotation/

## load RepeatModeler
ml RepeatModeler/2.0.4-foss-2022a

# make a directory for storing logs
mkdir -p logs

# build new RepeatModeler BLAST database with a name that includes an ID (e.g., a species code, specimen ID, etc.) and genus/species. Modify accordingly.
BuildDatabase -name $rep_base -engine ncbi $fasta

# now run RepeatModeler with 32 cores and send results from STDOUT and STDERR streams to 1_repeatmodeler.log
# in my experience this command takes 1-3 days
RepeatModeler -threads 32 -engine ncbi -database $rep_base 2>&1 | tee 00_repeatmodeler.log
