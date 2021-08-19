import pandas as pd
from snakemake.utils import validate, min_version
##### set minimum snakemake version #####
min_version("5.1.2")


##### load config and sample sheets #####

configfile: "config.yaml"


##### target rules #####

rule all:
  input:
    expand("{sample}/ec/{sample}_R1.clean.ec.fastq.gz", sample=config["samples"]),
    expand("{sample}/ec/{sample}_R2.clean.ec.fastq.gz", sample=config["samples"]),

##### load rules #####

include: "rules/bbduk.smk"
include: "rules/spades_ec.smk"
