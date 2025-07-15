#!/bin/bash
#SBATCH --job-name=AGATHap1
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=srb67793@uga.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=30gb
#SBATCH --time=2-00:00:00
#SBATCH --output=AGAT.%j.out
#SBATCH --error=AGAT.%j.err

ml AGAT
ml gffread

gffread /scratch/srb67793/GenomeAnnotation_Spr2025/BRAKER/G_maculatum_BRAKER_Hap1/braker/braker.gff3 \
        -g /scratch/srb67793/GenomeAssembly_Spr2025/Results/FCS/G_maculatum_BF73-hap1-JBAT.FINAL.clean.fa.masked \
        -o braker/G_maculatum.nofilter.gff3 \
        --keep-genes \
        -O \
        -d braker/gff_duplication_info.nofilter \
        -x braker/splicedCDS.nofilter.fasta -y braker/peptides.nofilter.fasta \
        -W -S --sort-alpha

gffread /scratch/srb67793/GenomeAnnotation_Spr2025/BRAKER/G_maculatum_BRAKER_Hap1/braker/braker.gff3 \
        -g /scratch/srb67793/GenomeAssembly_Spr2025/Results/FCS/G_maculatum_BF73-hap1-JBAT.FINAL.clean.fa.masked \
        -o braker/G_maculatum.filter.gff3 \
        --keep-genes \
        -O -V -H -B -P --adj-stop \
        -M -d braker/gff_duplication_info -K \
        --force-exons --gene2exon --t-adopt \
        -x braker/splicedCDS.filter.fasta -y braker/peptides.filter.fasta \
        -W -S --sort-alpha -l 300 -J

 # get stats for preliminary gff3 file converted by AGAT
agat_sp_statistics.pl --gff braker/G_maculatum.nofilter.gff3 -o braker/G_maculatum.nofilter.gff3.stats.out

# get stats for final gff3 file filtered by gffread
agat_sp_statistics.pl --gff braker/G_maculatum.filter.gff3 -o braker/G_maculatum.filter.gff3.stats.out

# get longest isoforms for busco analysis
agat_sp_keep_longest_isoform.pl -gff braker/G_maculatum.nofilter.gff3 > braker/G_maculatum.longest_isoforms.gff
gffread braker/G_maculatum.longest_isoforms.gff -g /scratch/srb67793/GenomeAssembly_Spr2025/Results/FCS/G_maculatum_BF73-hap1-JBAT.FINAL.clean.fa.masked -y braker/G_maculatum.longest_isoforms.faa >/dev/null
