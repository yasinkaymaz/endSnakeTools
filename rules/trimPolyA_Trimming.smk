rule trimPolyA_Tstrecth:
    input:
        fastq = '{read_id}.fastq'
    output:
        r1 = 'cutadapt/SE_trimmed_{read_id}.fastq'
    params:
        flags = "-g NNNNTTTTTTTTTT -n 3 -g TTTTTTTTTT -n 10 -g AAAAAAAAAAA -n 10 -a TTTTTTTTTT -n 10 -a AAAAAAAAAAA -n 10 -b TGGAATTCTCGGGTGCCAAGGAACTCCAGTCACNNNNNNATCTCGTATGCCGTCTTCTGCTTG -e 0.1 -O 4 -m 10"
    shell:
        'cutadapt {params.flags} -o {output.r1} {input.fastq}'


