
rule trim_reads_pe:
    input:
        unpack(get_fastq)
    output:
        r1="data/trim/{sample}.trim.1.fastq.gz",
        r2="data/trim/{sample}.trim.2.fastq.gz",
        r1_unpaired="data/trim/{sample}.1.unpaired.fastq.gz",
        r2_unpaired="data/trim/{sample}.2.unpaired.fastq.gz",
        trimlog="data/trim/{sample}.trimlog.txt"
    params:
        extra=lambda w, output: "-trimlog {}".format(output.trimlog),
        trimmer=" ".join(config["params"]["trimmomatic"]["pe"]["trimmer"]),
        adapter=config["params"]["trimmomatic"]["illumina_clip"]
    log:
        "log/trimmomatic/{sample}.log"
    threads: 16
    shell:"""
        module purge
        module load trimmomatic
        java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.36.jar PE -threads \
            {threads} {params.extra} {input.r1} {input.r2} {output.r1} {output.r1_unpaired} {output.r2} {output.r2_unpaired} \
            ILLUMINACLIP:{params.adapter} {params.trimmer} 2>&1 | tee {log}
        """

rule kraken:
    input:
        reads=get_trimmed_reads
    output:
        "results/kraken/{sample}_kraken2_report.txt"
    log:
        "log/kraken/{sample}.log"
    params:
        db=config["kraken_db"]["name"]
    shell:"""
        module load Kraken
        kraken2 --gzip-compressed --paired --report {output} --db {params.db} {input.reads} 2> {log}
        """

