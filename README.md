# Viral genome assembly and variant calling

download this repository with 
`git clone --recursive https://github.niaid.nih.gov/sterndb/viral-assembly-variant-calling`

Snakemake pipeline to assemble a viral consensus sequence, and optionally call SNPs and haplotypes.

The data directory should have a separate directory for each sample. Multiple fastq files per sample will be concatenated prior to analysis. All fastq files should end with either _R1.fastq or _R2.fastq.

An example directory structure is below:

```bash
data
├── SRR8209080
│   └── fastq
│       ├── SRR8209080_R1.fastq
│       └── SRR8209080_R2.fastq
├── SRR8209081
│   └── fastq
│       ├── SRR8209081_R1.run1.fastq
│       └── SRR8209081_R2.run1.fastq
|       ├── SRR8209081_R1.run2.fastq
│       └── SRR8209081_R2.run2.fastq
└── SRR8209083
    └── fastq
        ├── SRR8209083_R1.fastq
        └── SRR8209083_R2.fastq
```

Usage:  
Edit config file to indicate - 
1. Reference-based or denovo assembly  
    - If reference-based, path to reference fasta and (optional) .gtf 
2. Whether to preform rare variant calling with LoFreq and haplotype calling with CliqueSNV
3. Sample names

On NIAID HPC Locus, edit the submit.sh file to indicate your email address.
