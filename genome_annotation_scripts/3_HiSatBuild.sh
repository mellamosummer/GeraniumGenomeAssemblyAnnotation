#!/bin/bash
#SBATCH --job-name=HisatBuildHap1
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=30gb
#SBATCH --time=7-00:00:00
#SBATCH --output=HisatBuild.%j.out
#SBATCH --error=HisatBuild.%j.err

module load HISAT2
hisat2-build /scratch/srb67793/GenomeAssembly_Spr2025/Results/FCS/G_maculatum_BF73-hap1-JBAT.FINAL.clean.fa.masked G_maculatum_BF73-hap1-JBAT.FINAL.clean.fa.masked.index-p 8
