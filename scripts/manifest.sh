#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input-directory> <output-directory>"
    exit 1
fi

input_dir=$1
output_dir=$2

echo -e "sample-id\tforward-absolute-filepath\treverse-absolute-filepath" > ${output_dir}/manifest.tsv

for file in $input_dir/*.fastq.gz; do

    sample=$(basename $(echo $file | cut -d'_' -f1,2))
    if [[ $file == *"_R1"* ]]; then
        fwd=$(readlink -f $file)
    elif [[ $file == *"_R2"* ]]; then
        rev=$(readlink -f $file)
    fi
    if [[ ! -z $fwd && ! -z $rev ]]; then
        echo -e "${sample}\t${fwd}\t${rev}" >> ${output_dir}/manifest.tsv
        fwd=""
        rev=""
    fi
done