#!/bin/bash
#SBATCH --job-name=RM
#SBATCH --partition=batch
#SBATCH --ntasks=16
#SBATCH --mem=75gb
#SBATCH --time=7-00:00:00
#SBATCH --output=RM2_clean.out
#SBATCH --error=RM2_clean.err

# script modified from (PBentz 30 NOV 2023)

#path to genome 
fasta="/scratch/srb67793/GenomeAssembly_Spr2025/Results/FCS/G_maculatum_BF73-hap2-JBAT.FINAL.clean.fa"


#repeats downloaded from https://www.girinst.org/server/RepBase/index.php
#downloaded this file to local, then transferred to sapelo2 RepBase30.03.fasta.tar.gz
#cat RepBase30.03.fasta.tar.gz & (repeat families from repeatmodeler step) > hap2_repeats.fa

#path to concatenated repeats
repeats="/scratch/srb67793/GenomeAnnotation_Spr2025/repeatmodeler_hap1/hap2_repeats.fa"

# load RepeatMasker
ml RepeatMasker

# run RepeatMasker
RepeatMasker $fasta -lib $repeats -cutoff 250 -nolow -pa 16 -xsmall -gff


# options explained:

# -cutoff
#When using a local library you may want to change the minimum score
#for reporting a match. The default is 225, lowering it below 200 will
#usually start to give you significant numbers of false matches,
#raising it to 250 will guarantee that all matches are real. Note that
#low complexity regions in otherwise complex repeat sequences in your
#library are most likely to give false matches.
# -xsmall returns repetitive regions in lowercase (rest capitals) rather than masked
# -nolow         does not mask low complexity DNA or simple repeats (recommended for annotation predictions)
