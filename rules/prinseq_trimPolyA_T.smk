rule prinseq_trimPolyA_T:
    input:
        '{read_id}.fastq'
    output:
        'prinseq/SE_trimmed_{read_id}.fastq'
    conda:
        "envs/trimmer.yml"
    log:
        "prinseq/prinseq_{read_id}.log"
    shell:
        'mkdir -p prinseq && \
        prinseq-lite.pl \
        -fastq {input} \
        -trim_tail_left 10 \
        -trim_tail_right \
        -out_good prinseq/SE_trimmed_{read_id} \
        -out_bad prinseq/SE_trimmed_{read_id} \
        -log {log}'
