#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/juicerpre.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/juicerpre.%j.err
#SBATCH --job-name=juicerpre_32025
#SBATCH --partition=batch
#SBATCH --time=7-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50GB

#load modules
module load YaHS

#set dir
HIFIASMDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM/"
YAHSDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM/yahs"

#Run the YaHS "juicer pre" command
juicer pre \
    -a \
    -o $YAHSDIR/G_maculatum_BF73-hap2-JBAT \
    $YAHSDIR/G_maculatum_BF73-hap2.bin \
    $YAHSDIR/G_maculatum_BF73-hap2_scaffolds_final.agp \
    $HIFIASMDIR/G_maculatum_BF73.asm.hic.hap2.p_ctg.fa.fai > $YAHSDIR/G_maculatum_BF73-hap2-JBAT.log 2>&1
