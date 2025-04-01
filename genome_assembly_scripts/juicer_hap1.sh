#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/juicer.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/juicer.%j.err
#SBATCH --job-name=juicer_32025
#SBATCH --partition=batch
#SBATCH --time=7-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50GB

#module load
ml Juicer

#set dir
YAHSDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM/yahs"

java -jar $EBROOTJUICEBOX/juicer_tools.2.20.00.jar pre \
      $YAHSDIR/G_maculatum_BF73-hap1-JBAT.txt $YAHSDIR/G_maculatum_BF73-hap1-JBAT.hic <(cat $YAHSDIR/G_maculatum_BF73-hap1-JBAT.log | grep PRE_C_SIZE | awk '{print $2" "$3}')

