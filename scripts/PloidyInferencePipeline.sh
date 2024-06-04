#!/bin/bash
#SBATCH --job-name=testPip         # Job name
#SBATCH --partition=batch             # Partition (queue) name
#SBATCH --ntasks=10                    # Run on a single CPU
#SBATCH --mem=100gb                     # Job memory request
#SBATCH --time=02:00:00               # Time limit hrs:min:sec
#SBATCH --output=%x.%j.out            # Standard output log
#SBATCH --error=%x.%j.err             # Standard error log

#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=srb67793@uga.edu  # Where to send mail      

ml BioPerl
perl PIP.pl ../PIP_example/PIP_control
