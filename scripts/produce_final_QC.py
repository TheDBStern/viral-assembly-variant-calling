
from pathlib import Path
import pandas as pd
import numpy as np

### constants
read_mapped_filter = 90

# samtools report
sam_df = pd.read_csv(snakemake.params.samtools_qc, sep="\t")
sam_df.columns = sam_df.columns.str.lower()
sam_df = sam_df[['sample', 'reads_mapped_percent']]
sam_df['filt_reads_mapped'] = np.where(sam_df['reads_mapped_percent'] >= read_mapped_filter, 'PASS', 'FAIL')

# coverage report
cov_df = pd.read_csv(snakemake.input.coverage_qc)

# merge results and write
results = pd.merge(sam_df, cov_df, on='sample')

results.to_csv(snakemake.output.qc_report, index=False)