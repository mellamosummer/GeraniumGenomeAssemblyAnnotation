#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/yahspost.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/yahspost.%j.err
#SBATCH --job-name=juicerpre_32025
#SBATCH --partition=batch
#SBATCH --time=7-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=20GB

#load modules
module load YaHS

#set dir
HIFIASMDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM/"
YAHSDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM/yahs"
JUICERDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM/juicer"

#Run the YaHS "juicer pre" command
juicer post \
    -o $JUICERDIR/G_maculatum_BF73-hap1-JBAT \
    $JUICERDIR/G_maculatum_BF73-hap1-JBAT.review.assembly \
    $YAHSDIR/G_maculatum_BF73-hap1-JBAT.liftover.agp \
    $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap1.p_ctg.fa
