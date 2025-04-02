#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/HiCSAM.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/HiCSAM.%j.err
#SBATCH --job-name=HiC_32025
#SBATCH --partition=batch
#SBATCH --time=7-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10GB

#load modules
ml SAMtools

#set dirs
HIFIASMDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM"
OMNICDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Redownloaded_data"

#run SAMtools
samtools view -h -b -F 2316 $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg_vs_HiC.sam > $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg_vs_HiC.bam
samtools sort -n $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg_vs_HiC.bam > $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg_vs_HiC.sorted.bam

#HiC
#do this interactively 
#singularity exec /apps/singularity-images/hic_qc_6881c33_ps.sif hic_qc.py -b G_maculatum_BF73.asm.hic.hap1.p_ctg_vs_HiC.sorted.ba$


