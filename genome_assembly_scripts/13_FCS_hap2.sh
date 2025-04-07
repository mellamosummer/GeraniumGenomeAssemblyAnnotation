#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --output=/scratch/srb67793/GenomeAssembly_Spr2025/FCSCleanHap2.%j.out
#SBATCH --error=/scratch/srb67793/GenomeAssembly_Spr2025/FCSCleanHap2.%j.err
#SBATCH --job-name=fcs_32025
#SBATCH --partition=batch
#SBATCH --time=7-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=50GB

#contamination report FCS-GX
ml ncbi-FCS

#set dirs
FCSDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/FCS"
GENOMEDIR="/scratch/srb67793/GenomeAssembly_Spr2025/Results/HiFiASM/juicer"

#screen genome
python $EBROOTNCBIMINFCS/fcs.py screen genome --fasta $GENOMEDIR/G_maculatum_BF73-hap2-JBAT.FINAL.fa --out-dir $FCSDIR --gx-db "$GXDB_LOC/gxdb" --tax-id 1663611

#clean genome
cat $GENOMEDIR/G_maculatum_BF73-hap2-JBAT.FINAL.fa | python $EBROOTNCBIMINFCS/fcs.py clean genome --action-report $FCSDIR/G_maculatum_BF73-hap2-JBAT.FINAL.1663611.fcs_gx_report.txt  --output $FCSDIR/G_maculatum_BF73-hap2-JBAT.FINAL.clean.fa --contam-fasta-out $FCSDIR/G_maculatum_BF73-hap2-JBAT.FINAL.contam.fa
