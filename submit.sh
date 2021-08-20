#!/bin/bash

# submit this file with:  qsub submit.sh

# Job Name
#$ -N test_viral_genomics

# run from current working directory
#$ -cwd

#$ -m be
#$ -M david.stern@nih.gov

# log dirs
#$ -e ./log/submit_log/
#$ -o ./log/submit_log/


snake_log=$PWD/log/snake_log
mkdir -p $snake_log

# create qsub command
sbcmd="qsub -l {cluster.mem} -pe threaded {cluster.threads} -e $snake_log -o $snake_log "

module load snakemake

snakemake --use-conda --jobs 100 --rerun-incomplete --keep-going --cluster-config cluster.yaml --cluster "$sbcmd" --latency-wait 120 all
