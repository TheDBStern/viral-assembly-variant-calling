shell.prefix("set -eo pipefail; ")

rule bbduk:
  input:
  output:
    out1="data/{sample}/clean/{sample}_R1.clean.fastq",
    out2="data/{sample}/clean/{sample}_R2.clean.fastq"
  log:
        "data/{sample}/logs/trim.log"
  params:
        adapters=config["params"]["adapters"],
        bbduk=config["params"]["bbduk"]
  threads: config["threads"]["bbduk"]
  conda:
        "../envs/bbduk.yaml"
  shell:
      """
      cat data/{wildcards.sample}/fastq/*R1* > data/{wildcards.sample}/fastq/{wildcards.sample}_1.cat.fastq
      cat data/{wildcards.sample}/fastq/*R2* > data/{wildcards.sample}/fastq/{wildcards.sample}_2.cat.fastq
      bbduk.sh \
        threads={threads} \
        -Xmx100g \
        in=data/{wildcards.sample}/fastq/{wildcards.sample}_1.cat.fastq \
        in2=data/{wildcards.sample}/fastq/{wildcards.sample}_2.cat.fastq \
        out={output.out1} \
        out2={output.out2} \
        ref={params.adapters} \
        {params.bbduk}
        > {log} 2>&1
      """
