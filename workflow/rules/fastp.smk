LOG_DIR = os.path.join(OUT_DIR, "fastp", "logs")

rule fastp_qc:
    input:
        forward_reads = os.path.join(DATA_DIR, "{sample}_R1_001.fastq.gz"),
        reverse_reads = os.path.join(DATA_DIR, "{sample}_R2_001.fastq.gz")
    output:
        forward_qc = os.path.join(OUT_DIR, "fastp", "{sample}_1.fastq.gz"),
        reverse_qc = os.path.join(OUT_DIR, "fastp", "{sample}_2.fastq.gz"),
        report = os.path.join(OUT_DIR, "fastp", "{sample}.html"),
        json = os.path.join(OUT_DIR, "fastp", "{sample}.json")
    log:
        log = os.path.join(LOG_DIR, "{sample}.log"),
        outlog = os.path.join(LOG_DIR, "{sample}.qout"),
        errlog = os.path.join(LOG_DIR, "{sample}.qerr")
    threads:
        8
    resources:
        mem=4_000
    conda:
        "ngsreads"
    shell:
        """
        fastp -i {input.forward_reads} -I {input.reverse_reads} -o {output.forward_qc} -O {output.reverse_qc} \
        -h {output.report} -j {output.json} --thread {threads} 2>> {log.log}
        """
