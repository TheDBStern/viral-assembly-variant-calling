set -e
true
true
/sysapps/cluster/software/Anaconda/2.3.0Linux-x86_64/envs/spades/bin/spades-hammer /hpcdata/bcbb/stern/pipelines/viral_assembly_variant_calling/SRR8209080/ec/corrected/configs/config.info
/sysapps/cluster/software/Anaconda/2.3.0Linux-x86_64/envs/spades/bin/python /sysapps/cluster/software/Anaconda/2.3.0Linux-x86_64/envs/spades/share/spades/spades_pipeline/scripts/compress_all.py --input_file /hpcdata/bcbb/stern/pipelines/viral_assembly_variant_calling/SRR8209080/ec/corrected/corrected.yaml --ext_python_modules_home /sysapps/cluster/software/Anaconda/2.3.0Linux-x86_64/envs/spades/share/spades --max_threads 8 --output_dir /hpcdata/bcbb/stern/pipelines/viral_assembly_variant_calling/SRR8209080/ec/corrected --gzip_output
true
/sysapps/cluster/software/Anaconda/2.3.0Linux-x86_64/envs/spades/bin/python /sysapps/cluster/software/Anaconda/2.3.0Linux-x86_64/envs/spades/share/spades/spades_pipeline/scripts/breaking_scaffolds_script.py --result_scaffolds_filename /hpcdata/bcbb/stern/pipelines/viral_assembly_variant_calling/SRR8209080/ec/scaffolds.fasta --misc_dir /hpcdata/bcbb/stern/pipelines/viral_assembly_variant_calling/SRR8209080/ec/misc --threshold_for_breaking_scaffolds 3
true
