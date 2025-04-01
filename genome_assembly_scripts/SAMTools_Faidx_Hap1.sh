#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/yahsFAIDX.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/yahsFAIDX.%j.err
#SBATCH --job-name=yahsfaidx_32025
#SBATCH --partition=batch
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10GB

#load modules
ml SAMtools

#set dirs
HIFIASMDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM"

#run samtools
samtools faidx $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg.fa 



