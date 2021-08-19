import pandas as pd
import numpy as np
from snakemake.utils import validate
from snakemake.shell import shell


# helper functions
def add_fq(row):
    read_path = "data/raw"
    return ["{}/{}_1.fastq.gz".format(read_path, row['sample']), "{}/{}_2.fastq.gz".format(read_path, row['sample'])]

##### config file and sample sheets #####
# config
configfile: "config.yaml"
validate(config, schema="schemas/config.schema.yaml")

# process sample table
samples = pd.read_csv(config["samples"])
samples['fq1'], samples['fq2'] = zip(*samples.apply(lambda row: add_fq(row), axis=1))
samples.set_index("sample", drop=False, inplace=True)

validate(samples, schema="schemas/samples.schema.yaml")

##### Target rules #####
include: "rules/common.smk"

kraken_out = expand("results/kraken/{sample}_kraken2_report.txt", sample=samples.index)

rule all:
    # input: "results/kraken_QC_report.csv"
    input: kraken_out

##### Modules #####
include: "rules/kraken.smk"
