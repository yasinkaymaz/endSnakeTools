rule cutadapt_trimPolyA_T:
    input:
        '{read_id}.fastq'
    output:
        'cutadapt/SE_trimmed_{read_id}.fastq'
    params:
        flags = "-j 0 -g NNNNTTTTTTTTTT -n 3 -g TTTTTTTTTT -n 10 -g AAAAAAAAAAA -n 10 -a TTTTTTTTTT -n 10 -a AAAAAAAAAAA -n 10 -b TGGAATTCTCGGGTGCCAAGGAACTCCAGTCACNNNNNNATCTCGTATGCCGTCTTCTGCTTG -e 0.1 -O 4 -m 10"
    conda:
        "envs/trimmer.yml"
    log:
        "cutadapt/cutadapt_{read_id}.log"
    shell:
        'mkdir -p cutadapt && \
        cutadapt {params.flags} \
        --output {output} \
        {input}'
