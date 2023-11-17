# sinuses_2023
Rhinosinusitis 16S analysis.


## Metagenomic analysis
1. Quality filtring and trimming - [fastp](https://github.com/OpenGene/fastp)
2. Host removal - [bwa-mem](https://github.com/lh3/bwa) + human genome reference (GRCh38) (best, although slow according to [paper](https://journals.asm.org/doi/10.1128/msystems.01378-21))
3. Taxonomical annotation - [mOTU-tool](https://github.com/motu-tool/mOTUs)
4. Contig assembly - [MetaSPAdes](https://github.com/ablab/spades)
5. AMR annotation - [staramr](https://github.com/phac-nml/staramr)

### 2023-11-17
- many reads are mapped to host
    - double-checked code, currently copies [Qiita workflow](https://github.com/qiita-spots/qp-fastp-minimap2/blob/main/qp_fastp_minimap2/qp_fastp_minimap2.py)
- trying alternative refrence NCBI GRCh18 from [Illumina](https://support.illumina.com/sequencing/sequencing_software/igenome.html)