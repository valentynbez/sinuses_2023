import os

LOG_DIR = os.path.join(OUT_DIR, "host_removed", "logs")

rule bwa_human_removal:
    input:
        fq1 = rules.fastp_qc.output.forward_qc,
        fq2 = rules.fastp_qc.output.reverse_qc
    output:
        aligned_to_human = os.path.join(OUT_DIR, "host_removed", "{sample}.bam"),
        fq1_filtered = os.path.join(OUT_DIR, "host_removed", "{sample}_1.fastq.gz"),
        fq2_filtered = os.path.join(OUT_DIR, "host_removed", "{sample}_2.fastq.gz")
    log:
        qout = os.path.join(LOG_DIR, "{sample}.qout"),
        qerr = os.path.join(LOG_DIR, "{sample}.qerr"),
        log = os.path.join(LOG_DIR, "{sample}.log")
    conda:
        "minimap"
    threads:
        8
    resources:
        mem=10_000
    params:
        bwa_ref = config["BWA_REF"]
    shell:
        """
        bwa mem -t {threads} {params.bwa_ref} {input.fq1} {input.fq2} | samtools view -bS - | \
        samtools sort -@ {threads} -o {output.aligned_to_human} - 2>> {log.log} && \
        samtools fastq -f 12 -F 256 -1 {output.fq1_filtered} -2 {output.fq2_filtered} {output.aligned_to_human} 2>> {log.log}
        """