rule bowtie2_index_down:
    output:
        idx=multiext(
            "bowtie2_index/GRCh38_noalt_as",
            ".1.bt2",
            ".2.bt2",
            ".3.bt2",
            ".4.bt2",
            ".rev.1.bt2",
            ".rev.2.bt2")
    shell:
        "wget https://genome-idx.s3.amazonaws.com/bt/GRCh38_noalt_as.zip && \
        gunzip GRCh38_noalt_as.zip && \
        mkdir bowtie2_index && \
        mv GRCh38_noalt_as* bowtie2_index"
