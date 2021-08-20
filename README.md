# Viral assembly and variant calling

download this repository with 
`git clone --recursive https://github.niaid.nih.gov/sterndb/viral-assembly-variant-calling`

Snakemake pipeline to assemble a viral consensus sequence, and optionally call SNPs and haplotypes.
Runs on NIAID Locus HPC

The following modules with be loaded on Locus:
Python=3.7.3. 
GATK=4.2.0.0
Picard=2.22.7
Samtools=1.9
LoFreq=2.1.3.1

Usage:  
Edit config file to indicate - 
1. Reference-based or denovo assembly  
    - If reference-based, path to reference fasta and (optional) .gtf 
2. Whether to preform rare variant calling with LoFreq and haplotype calling with CliqueSNV


