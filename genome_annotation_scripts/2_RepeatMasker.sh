#!/bin/bash
#SBATCH --job-name=RM
#SBATCH --partition=batch
#SBATCH --ntasks=16
#SBATCH --mem=75gb
#SBATCH --time=7-00:00:00
#SBATCH --output=RM1_clean.out
#SBATCH --error=RM1_clean.err

# script by PBentz 30 NOV 2023

## name variables:
# path to genome assembly fasta file (does not need to be masked)
fasta='/scratch/srb67793/Geranium/Results/FCS/G_maculatum_BF73.asm.hap1.clean.fasta'

## load RepeatMasker
ml RepeatMasker/4.1.5-foss-2022a

## repeats downloaded from https://www.girinst.org/server/RepBase/index.php
## use curl to download and make a fasta file, then concatenate with the first script results

## run RepeatMasker
RepeatMasker $fasta -lib repbase_hap1cleaned.fasta  -cutoff 250 -nolow -pa 16 -xsmall -gff


## options explained:

# -cutoff
#When using a local library you may want to change the minimum score
#for reporting a match. The default is 225, lowering it below 200 will
#usually start to give you significant numbers of false matches,
#raising it to 250 will guarantee that all matches are real. Note that
#low complexity regions in otherwise complex repeat sequences in your
#library are most likely to give false matches.

# -xsmall returns repetitive regions in lowercase (rest capitals) rather than masked
# -nolow         does not mask low complexity DNA or simple repeats (recommended for annotation predictions)
