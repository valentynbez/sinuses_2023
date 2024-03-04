# Sinuses 2023
Exploratory bioinformatic and data analysis for rhinosinusitis microbiome project. 16S sequencing to metagenomic sequencing.

# Log


## 2024-03-04
- metagenomic sequencing discarded - contamination with host reads is too high (>95%)
- running mock communities for 16S V3-V4 (341F-805R)
    - relative abundances are off
    - notebook: `notebooks/mock-community-bacteria.ipynb`
    - results barplot: `visualizations/mock/gg2-barplot.qzv`
- running mock communities for ITS1:
    - the UNITE database is too big - should be run in `bash` with `TMPDIR` reassigned and enough space
    - the only detected species is *C. neoformans*
    - notebook: `notebooks/mock-community-fungi.ipynb`
    - resulting barplot: `visualizations/mock/taxonomy-barplot-fungi.qzv`
- results can be downloaded to any computer and opened with [QIIME2 View](https://view.qiime2.org/)


## 2023-11-17
- many reads (> 95%) are mapped to host
    - double-checked code, currently copies [Qiita workflow](https://github.com/qiita-spots/qp-fastp-minimap2/blob/main/qp_fastp_minimap2/qp_fastp_minimap2.py)
- trying alternative refrence NCBI GRCh38 from [Illumina](https://support.illumina.com/sequencing/sequencing_software/igenome.html) instead of one downloaded straight from NCBI.
- the situation was not resolved, see [notebook](https://github.com/valentynbez/sinuses_2023/blob/master/notebooks/dev.ipynb)
- most samples contain <1% of non-human reads

## 2023-11-16
- Started designing metagenomic pipeline.