# Viral assembly and variant calling
Snakemake pipeline to assemble a viral consensus sequence, and optionally call SNPs and haplotypes

Requirements:
Bioconda=  
Lofreq=. 

Usage:  
Edit config file to indicate - 
1. Reference-based or denovo assembly  
    - If reference-based, path to reference fasta and (optional) .gtf 
2. Whether to preform rare variant calling with LoFreq and haplotype calling with PredictHaplo
