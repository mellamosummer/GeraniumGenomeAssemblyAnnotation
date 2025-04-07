#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/BUSCOHap2.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/BUSCOHa2.%j.err
#SBATCH --job-name=BUSCO_32025
#SBATCH --partition=batch
#SBATCH --time=7-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=100GB

#load module
ml BUSCO

rm -r G_maculatum_BF73-hap2-busco

#run BUSCO
busco \
    -i /scratch/srb67793/GenomeAssembly_Spr2025/Results/BUSCO/BUSCO_inputfiles_hap2 \
    -m genome \
    -o G_maculatum_BF73-hap2-busco \
    -l eudicots_odb10 \
    -c 20
