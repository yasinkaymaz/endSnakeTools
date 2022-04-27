rule samtools:
    input:
        sam='aligned_reads/aligned_{read_id}.sam'
    output:
        bam='aligned_reads/aligned_{read_id}.sorted.bam',
        bai='aligned_reads/aligned_{read_id}.sorted.bam.bai'
    conda:
        "envs/aligner.yml"
    shell:
        "samtools view --bam {input.sam} | samtools sort - > {output.bam} \
        samtools index {output.bam}"
