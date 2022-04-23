rule genomeAlign:
    input:
        fastq = "cutadapt/SE_trimmed_{read_id}.fastq",
        genome = {genome_prefix}
    output:
        'aligned_reads/aligned_{read_id}.sam'
    params:
        flags = "-x {input.genome} -q {input.fastq}"
    shell:
        'bowtie2 {params.flags} -S {output} '

