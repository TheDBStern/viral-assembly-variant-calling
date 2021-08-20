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
    "data/{sample}/logs/lofreq.log"

  shell:
      """
      module purge
      module load lofreq/2.1.3.1
      module load samtools/1.9-goolf-1.7.20

      samtools view \
            -b \
            -T ref/HIV_B.K03455.HXB2.fasta \
            SRR8209080/SRR8209080.smblast.bt2.bam \
        | lofreq viterbi \
            -f ref/HIV_B.K03455.HXB2.fasta \
            - \
        | samtools sort \
            - \
        | lofreq indelqual \
            -f ref/HIV_B.K03455.HXB2.fasta \
            --dindel \
            - \
        > SRR8209080/SRR8209080.lofreq.bam

              > {log} 2>&1
      """
