# Viral genome assembly and variant calling

This is a Snakemake pipeline to generate a consensus sequence and call variants (SNPs and haplotypes) using viral amplicon short-read Illumina data and a reference genome.

download this repository with 
`git clone --recursive https://github.niaid.nih.gov/sterndb/viral-assembly-variant-calling`

Snakemake pipeline to assemble a viral consensus sequence, and optionally call SNPs and haplotypes.

The data directory should have a separate directory for each sample. Multiple fastq files per sample will be concatenated prior to analysis. All fastq files should end with either _R1.fastq or _R2.fastq.

There are two pipeline options:
1. Reference-mapping approach. Map error-corrected reads to a reference genome and generate a consensus sequence based on majority variants. Best if the data are expected to be quite similar to the reference genome.
2. De-novo assembly and scaffolding. Assemble contigs directly from error-corrected reads. Scaffold the contigs (i.e. order and orient) based on alignment to a reference genome. Best if the data are expected to be quite divergent from the reference genome and may have large structural variants.

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
1. Edit config file to indicate reference-mapping or denovo approach  
2. 


On NIAID HPC Locus, edit the submit.sh file to indicate your email address.
