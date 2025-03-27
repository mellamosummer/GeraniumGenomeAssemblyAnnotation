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
#SBATCH --cpus-per-task=32
#SBATCH --mem=500GB

#script modified from https://gitlab.com/ficklinlab-public/wa-38-genome/-/tree/main/04-nuclear_assembly?ref_type=heads
#set output directory variable
MAINDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Redownloaded_data"
OUTDIR="/scratch/srb67793/GenomeAssembly_Spr2025"

#load modules
module purge
module load hifiasm/0.24.0-GCCcore-12.3.0
ml fastp

#convert bzip to gz (OmniC Reads -- HiFiASM will throw a segmentation fault error if not in gz format)
bzcat $MAINDIR/LAWR_OmniC_NA_NA_GAGACGAT_Geranium_maculatum_BF73-Geranium_maculatum_BF73_OmniC_I1420_L6_R1.fastq.bz2 | gzip -c > $MAINDIR/LAWR_OmniC_NA_NA_GAGACGAT_Geranium_maculatum_BF73-Geranium_maculatum_BF73_OmniC_I1420_L6_R1.fastq.gz
bzcat $MAINDIR/LAWR_OmniC_NA_NA_GAGACGAT_Geranium_maculatum_BF73-Geranium_maculatum_BF73_OmniC_I1420_L6_R2.fastq.bz2 | gzip -c > $MAINTDIR/LAWR_OmniC_NA_NA_GAGACGAT_Geranium_maculatum_BF73-Geranium_maculatum_BF73_OmniC_I1420_L6_R2.fastq.gz

#create the phased assembly at contig level using HiFiASM
mkdir -p /scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM
hifiasm -t 32 -o /scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM/G_maculatum_BF73.asm --h1 $MAINDIR/LAWR_OmniC_NA_NA_GAGACGAT_Geranium_maculatum_BF73-Geranium_maculatum_BF73_OmniC_I1420_L6_R1_trim.fastq --h2 $MAINDIR/LAWR_OmniC_NA_NA_GAGACGAT_Geranium_maculatum_BF73-Geranium_maculatum_BF73_OmniC_I1420_L6_R2_trim.fastq.gz $MAINDIR/m84139_240224_134350_s2.hifi_reads.bc2080.fastq.gz $MAINDIR/m84139_240224_154318_s3.hifi_reads.bc2080.fastq.gz $MAINDIR/m84139_240316_071829_s2.hifi_reads.bc2002.fastq.gz
