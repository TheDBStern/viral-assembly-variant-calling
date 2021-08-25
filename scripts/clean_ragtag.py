from Bio import SeqIO

infile = open(snakemake.input[0], 'r')
outfile = open(snakemake.output[0], 'w')
for record in SeqIO.parse(infile, 'fasta'):
    if record.id != "Chr0_RagTag":
        SeqIO.write(record, outfile,'fasta')
