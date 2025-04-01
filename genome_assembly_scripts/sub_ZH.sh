Batch Script for 35661519
--------------------------------------------------------------------------------
#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/HiFiASM.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/HiFiASM.%j.err
#SBATCH --job-name=HIFIASM_32025
#SBATCH --partition=hugemem_p
#SBATCH --time=100:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=48
#SBATCH --mem=800GB

#script modified from https://gitlab.com/ficklinlab-public/wa-38-genome/-/tree/main/04-nuclear_assembly?ref_type=heads
#set output directory variable
MAINDIR="/scratch/srb67793/GenomeAssembly_Spr2025"

#load modules
module load hifiasm/0.19.6-GCCcore-11.3.0

#create the phased assembly at contig level using HiFiASM
mkdir -p $MAINDIR/Results/HiFiASM
hifiasm -o $MAINDIR/Results/HiFiASM/G_maculatum_BF73.asm -t 32 --h1 $MAINDIR/Geranium_PacBio/LAWR_OmniC_NA_NA_GAGACGAT_Geranium_maculatum_BF73-Geranium_maculatum_BF73_OmniC_I1420_L6_R1.fastq.bz2 --h2 $MAINDIR/Geranium_PacBio/LAWR_OmniC_NA_NA_GAGACGAT_Geranium_maculatum_BF73-Geranium_maculatum_BF73_OmniC_I1420_L6_R2.fastq.bz2 $MAINDIR/Geranium_PacBio/PBmix*/*

