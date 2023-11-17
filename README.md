# Sinuses 2023
Exploratory bioinformatic and data analysis for rhinosinusitis microbiome project. 16S sequencing to metagenomic sequencing.


## Metagenomic analysis
A workflow was designed and implemented using [Snakemake](https://github.com/snakemake/snakemake) including all tweaks needed for it to run on a particular server.
Workflow includes:
1. Quality filtring and trimming - [fastp](https://github.com/OpenGene/fastp)
2. Host removal - [bwa-mem](https://github.com/lh3/bwa) (best, although slow according to [paper](https://journals.asm.org/doi/10.1128/msystems.01378-21))

### Taxonomy
3. Taxonomical annotation - [mOTU-tool](https://github.com/motu-tool/mOTUs)

### MAG assembly
4. Contig assembly - [MetaSPAdes](https://github.com/ablab/spades)

### Functional annotation
5. AMR annotation - [staramr](https://github.com/phac-nml/staramr)

# Log

## 2023-11-17
- many reads (> 95%) are mapped to host
    - double-checked code, currently copies [Qiita workflow](https://github.com/qiita-spots/qp-fastp-minimap2/blob/main/qp_fastp_minimap2/qp_fastp_minimap2.py)
- trying alternative refrence NCBI GRCh38 from [Illumina](https://support.illumina.com/sequencing/sequencing_software/igenome.html) instead of one downloaded straight from NCBI.

## 2023-11-16
- Started designing metagenomic pipeline.