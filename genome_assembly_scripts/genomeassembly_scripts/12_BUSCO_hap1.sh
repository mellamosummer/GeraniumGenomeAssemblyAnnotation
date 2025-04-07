#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/BUSCOHap1.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/BUSCOHap1.%j.err
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

#run BUSCO
busco \
    -i /scratch/srb67793/GenomeAssembly_Spr2025/Results/BUSCO/BUSCO_inputfiles_hap1 \ #make new directory named BUSCO input files and copy genome to this dir
    -m genome \
    -o G_maculatum_BF73-hap1-busco \
    -l eudicots_odb10 \
    -c 20 # number of CPUS
