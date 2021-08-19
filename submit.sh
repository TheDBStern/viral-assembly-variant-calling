#!/bin/bash

# submit this file with:  qsub submit.sh

# run from current working directory
#$ -cwd

#$ -m be
#$ -M brendan.jeffrey@nih.gov

# log dirs
#$ -e ./log/submit_log/
#$ -o ./log/submit_log/

module load snakemake || exit 1

# create qsub command
sbcmd="qsub -l h_vmem={cluster.mem} "

# snake01_reads
snakemake --snakefile snakefile.smk --jobs 100 --rerun-incomplete --keep-going --cluster-config cluster.yaml --cluster "$sbcmd" --latency-wait 120 all
