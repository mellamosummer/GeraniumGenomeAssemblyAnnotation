#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/HiC.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/HiC.%j.err
#SBATCH --job-name=HiC_32025
#SBATCH --partition=batch
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=50GB

ml BWA
ml SAMtools

HIFIASMDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM"
OMNICDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Redownloaded_data"

#Step 1: The BWA aligner requires that the input sequences are indexed.
bwa index -a bwtsw $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg.fa 

#Step 2: Perform the BWA alignment
bwa mem -t 24 -5SP \
    $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg.fa \
    $OMNICDIR/LAWR_OmniC_NA_NA_GAGACGAT_Geranium_maculatum_BF73-Geranium_maculatum_BF73_OmniC_I1420_L6_R1.fastq.gz \
    $OMNICDIR/LAWR_OmniC_NA_NA_GAGACGAT_Geranium_maculatum_BF73-Geranium_maculatum_BF73_OmniC_I1420_L6_R2.fastq.gz > $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg_vs_HiC.sam
