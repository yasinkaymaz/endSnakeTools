rule samProcess:
    input:
        sam='aligned_reads/aligned_{read_id}.sam'
    output:
        bam='aligned_reads/aligned_{read_id}.sorted.bam',
        bai='aligned_reads/aligned_{read_id}.sorted.bam.bai'
        stat='aligned_reads/{read_id}_alignment_stats.txt
    conda:
        "envs/aligner.yml"
    shell:
        "samtools view --bam {input.sam} | samtools sort - > {output.bam} \
        samtools flagstat {output.bam} > {output.stats} \
        samtools index {output.bam}"
