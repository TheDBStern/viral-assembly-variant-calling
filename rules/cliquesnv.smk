shell.prefix("set -eo pipefail; ")


rule cliquesnv:
  input:
    "data/{sample}/{sample}.bt2.rmdup.bam"
  output:
    "data/{sample}/{sample}.haplotypes.cliquesnv.fasta"
  log:
    "data/{sample}/logs/cliquesnv.log"
  conda:
    "../envs/cliquesnv.yaml"


  shell:
      """
      module purge

      cliquesnv -m snv-illumina \
                -threads 8 \
                -in {input} \
                -fdf extended \
                -outDir "data/{wildcards.sample}/" \
                > {log} 2>&1
      mv data/{wildcards.sample}/{wildcards.sample}.bt2.rmdup.fasta {output}
      rm data/{wildcards.sample}/{wildcards.sample}.bt2.rmdup.json
      """
