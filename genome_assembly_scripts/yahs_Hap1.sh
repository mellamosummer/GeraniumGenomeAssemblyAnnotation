#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/yahs.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/yahs.%j.err
#SBATCH --job-name=HiC_32025
#SBATCH --partition=batch
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10GB

#load modules
ml YaHS

#set dirs
HIFIASMDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM"
mkdir -p $HIFIASMDIR/yahs

#run yahs
yahs -o $HIFIASMDIR/yahs/G_maculatum_BF73-hap1 $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg.fa $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg_vs_HiC.sorted.bam
