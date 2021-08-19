shell.prefix("set -eo pipefail; ")

##### Wildcard constraints #####
wildcard_constraints:
    sample="|".join(samples.index)


##### Helper functions #####
def get_fastq(wildcards):
    """
    Get fastq files of given sample
    """
    fastqs = samples.loc[wildcards.sample, ["fq1", "fq2"]].dropna()
    return {"r1": fastqs.fq1, "r2": fastqs.fq2}

def get_trimmed_reads(wildcards):
    """
    Get trimmed reads of given sample
    """
    return expand("data/trim/{sample}.trim.{group}.fastq.gz", group=[1, 2], **wildcards)
