rule genomecov:
    input:
        sorted_bam = 'aligned_reads/aligned_{read_id}.sorted.bam',
        genome = 'genomes/{genome}'
    output:
        plus = "genomecov_bed/plusStrGenCov_{read_id}.genomecov",
        minus = "genomecov_bed/minStrGenCov_{read_id}.genomecov"
    log:
        "logs/genomecov_bed/{read_id}.log"
    conda:
        "envs/aligner.yml"
    shell:
        """genomeCoverageBed -ibam {input.sorted_bam} -g {input.genome} -strand + > {output.plus}
        genomeCoverageBed -ibam {input.sorted_bam} -g {input.genome} -strand + > {output.minus}"""

# Is input necessary for -dz option?
