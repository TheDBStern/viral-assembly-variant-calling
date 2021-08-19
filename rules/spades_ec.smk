shell.prefix("set -eo pipefail; ")


rule spades_ec:
  input:
    in1="{sample}/clean/{sample}_R1.clean.fastq",
    in2="{sample}/clean/{sample}_R2.clean.fastq"
  output:
    out1="{sample}/ec/{sample}_R1.clean.ec.fastq.gz",
    out2="{sample}/ec/{sample}_R2.clean.ec.fastq.gz"
  threads: config["threads"]["spades_ec"]
  log:
    "{sample}/logs/spades_ec.log"

  shell:
      """
      module purge
      module load spades/3.15.2
      spades.py --only-error-correction \
          -t {threads} \
          -1 {input.in1} \
          -2 {input.in2} \
          -o {wildcards.sample}/ec > {log} 2>&1

      mv {wildcards.sample}/ec/corrected/{wildcards.sample}_R1.clean.00.0_0.cor.fastq.gz {output.out1}
      mv {wildcards.sample}/ec/corrected/{wildcards.sample}_R2.clean.00.0_0.cor.fastq.gz {output.out2}
      rm -rf {wildcards.sample}/ec/corrected
      """
