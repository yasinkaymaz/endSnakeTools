rule genomeAlign:
    input:
        fastq = "cutadapt/SE_trimmed_{read_id}.fastq",
        genome = {genome_prefix}
    output:
        'aligned_reads/aligned_{read_id}.sam'
    shell:
        'mkdir aligned_{read_id} && bowtie2 -x {input.genome} -q {input.fastq} -S {output}'

