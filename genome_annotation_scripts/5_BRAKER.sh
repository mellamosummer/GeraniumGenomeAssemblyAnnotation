#!/bin/bash
#SBATCH --job-name=braker1
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --mem=220G
#SBATCH --time=7-00:00:00
#SBATCH --output=%j.brakerhap1.out
#SBATCH --error=%j.brakerhap1.err
#SBATCH --cpus-per-task=128


ml BRAKER/3.0.3-foss-2022a

braker.pl --genome=/scratch/srb67793/GenomeAssembly_Spr2025/Results/FCS/G_maculatum_BF73-hap1-JBAT.FINAL.clean.fa.masked --bam=G_maculatum_merged_hap1.bam --prot_seq=Viridiplantae.fa --softmasking --gff3 --threads=128 --species=G_maculatum --useexisting --TSEBRA_PATH=/apps/eb/TSEBRA/1.1.2-foss-2022a/bin/
