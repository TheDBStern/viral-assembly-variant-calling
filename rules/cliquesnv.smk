shell.prefix("set -eo pipefail; ")


rule cliquesnv:
  input:
    "data/{sample}/{sample}.bt2.rmdup.bam"
  output:
    "data/{wildcards.sample}/{wildcards.sample}.haplotypes.cliquesnv.fasta"
  log:
    "data/{sample}/logs/cliquesnv.log"
  conda:
    "envs/cliquesnv.yaml"


  shell:
      """
      module purge

      cliquesnv -m snv-illumina \
                -threads 8 \
                -in {input} \
                -fdf extended \
                -outDIR "data/{wildcards.sample}/"


      mv data/{wildcards.sample}/snv_output/{wildcards.sample}.bt2.rmdup.fasta {output}
      rm -rf data/{wildcards.sample}/snv_output/
      """
