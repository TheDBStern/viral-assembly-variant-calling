shell.prefix("set -eo pipefail; ")

rule bbduk:
  input:
  output:
    out1="{sample}/clean/{sample}_R1.clean.fastq",
    out2="{sample}/clean/{sample}_R2.clean.fastq"
  log:
        "{sample}/logs/trim.log"
  params:
        adapters=config["params"]["adapters"],
        bbduk=config["params"]["bbduk"]
  threads: config["threads"]["bbduk"]
  shell:
      """
      module purge
      module load bbmap/38.90
      cat {wildcards.sample}/fastq/*R1* > {wildcards.sample}/fastq/{wildcards.sample}_1.cat.fastq
      cat {wildcards.sample}/fastq/*R2* > {wildcards.sample}/fastq/{wildcards.sample}_2.cat.fastq
      bbduk.sh \
        threads={threads} \
        -Xmx100g \
        in={wildcards.sample}/fastq/{wildcards.sample}_1.cat.fastq \
        in2={wildcards.sample}/fastq/{wildcards.sample}_2.cat.fastq \
        out={output.out1} \
        out2={output.out2} \
        ref={params.adapters} \
        {params.bbduk}
        > {log} 2>&1
      """
