rule trimPolyA_Tprinseq:
    input:
        fastq = '{read_id}.fastq'
    output:
        r1 = 'prinseq/SE_trimmed_{read_id}.fastq'
    shell:
        'prinseq-lite.pl -fastq {input.fastq} -trim_tail_left 10 -trim_tail_right 10'


