shell.prefix("set -eo pipefail; ")


rule consiter:
  input:
    in1="data/{sample}/ec/{sample}_R1.clean.ec.fastq.gz",
    in2="data/{sample}/ec/{sample}_R2.clean.ec.fastq.gz"
  output:
    out1="data/{sample}/{sample}.consensus.fa",
    out2="data/{sample}/{sample}.bt2.rmdup.bam"
  params:
    ref=config["params"]["ref"],
    consiter=config["params"]["consiter"]
  threads: config["threads"]["consiter"]
  conda:
    "../envs/consiter.yaml"
  log:
    "data/{sample}/logs/consiter.log"

  shell:
      """
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
