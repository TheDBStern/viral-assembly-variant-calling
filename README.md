# Viral genome assembly and variant calling

This is a Snakemake pipeline to generate a consensus sequence and call variants (SNPs and haplotypes) using viral amplicon short-read Illumina data and a reference genome. Much of the work is performed by the Python script [ConsIter.py](https://github.niaid.nih.gov/sterndb/ConsIter) which iterates mapping of reads to a reference genome, calling variants, and updating the reference genome until there is no improvement in mapping rate. It then masks bases below a specified coverage threshold.

Download this repository with 
`git clone --recursive https://github.com/TheDBStern/viral-assembly-variant-calling`


There are two pipeline options:
1. Reference-mapping approach. Map error-corrected reads to a reference genome and generate a consensus sequence based on majority variants. Best if the data are expected to be quite similar to the reference genome.
2. De-novo assembly and scaffolding. Assemble contigs directly from error-corrected reads. Scaffold the contigs (i.e. order and orient) based on alignment to a reference genome. Best if the data are expected to be quite divergent from the reference genome and may have large structural variants.

The `ref` directory should contain adapter sequences and the reference genome. If targeted amplicon sequencing was performed, a multifasta file with each targeted region can be provided. 

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
Edit config file to indicate reference-mapping or denovo approach and files with reference genome, adapter sequences, and (optionally) primer sequences.  
Edit the samples.csv file with the names of the samples in the data directory.

If running locally, run: `snakemake --use-conda all`
