shell.prefix("set -eo pipefail; ")


rule consiter:
  input:
    in1="data/{sample}/ec/{sample}_R1.clean.ec.fastq.gz",
    in2="data/{sample}/ec/{sample}_R2.clean.ec.fastq.gz"
  output:
    "data/{sample}/{sample}.consensus.fa"
  params:
    ref=config["params"]["ref"],
    consiter=config["params"]["consiter"]
  threads: config["threads"]["consiter"]
  log:
    "data/{sample}/logs/consiter.log"

  shell:
      """
      module purge
      module load python/3.7.3-foss-2016b
      module load gatk/4.2.0.0-Java-1.8.0_92
      module load picard/2.22.7-Java-1.8.0_92
      module load samtools/1.9-goolf-1.7.20
      module load bowtie2/2.4.2-Python-3.6.12

      python ConsIter/ConsIter.py \
              -ref {params.ref} \
              -t {threads} \
              -n {wildcards.sample} \
              -o data/{wildcards.sample} \
              -1 {input.in1} \
              -2 {input.in2} \
              {params.consiter} \
              > {log} 2>&1
      """
