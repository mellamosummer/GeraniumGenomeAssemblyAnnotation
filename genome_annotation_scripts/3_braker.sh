#!/bin/bash
#SBATCH --job-name=braker1
#SBATCH --partition=highmem_p
#SBATCH --ntasks=48
#SBATCH --mem=220G
#SBATCH --time=155:00:00
#SBATCH --output=%j.brakerhap1_724.out
#SBATCH --error=%j.brakerhap1_724.err

# script by PBentz 30 NOV 2023

## put this script in working dir

# name variables:
# path to soft-masked assembly fasta file
ref='/scratch/srb67793/Geranium/Results/FCS/G_maculatum_BF73.asm.hap1.clean.fasta.masked'
# path to sorted RNA-Seq alignment (BAM) file(s)

# path to output directoy
out='/scratch/srb67793/Geranium/Results/BRAKER'

# make output directory
mkdir -p /scratch/srb67793/Geranium/Results/BRAKER

# load braker3 version 3.0.3
module load BRAKER/3.0.3-foss-2022a

braker.pl --genome $ref --workingdir=$out --prot_seq=Viridiplantae.fa

