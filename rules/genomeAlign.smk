configfile: "config/config.yaml"
rule genomeAlign:
    input:
        fastq = "cutadapt/SE_trimmed_{read_id}.fastq",
        #fastq = "prinseq/SE_trimmed_{read_id}.fastq",
        idx="bowtie2_index/GRCh38_noalt_as"
    output:
        'aligned_reads/aligned_{read_id}.sam'
    conda:
        "envs/aligner.yml"
    log:
        "aligned_reads/aligment_{read_id}.log"
    shell:
        'mkdir -p aligned_reads && bowtie2 -x {params.idx} -q {input.fastq} -S {output}'
