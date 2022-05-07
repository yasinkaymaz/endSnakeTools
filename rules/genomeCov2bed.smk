rule genomCov2bed:
  input:
    plus = "genomecov_bed/plusStrGenCov_{read_id}.genomecov",
    minus = "genomecov_bed/minStrGenCov_{read_id}.genomecov"
  output:
    plus = "genomecov_bed/plusStrGenCov_{read_id}.bed",
    minus = "genomecov_bed/minStrGenCov_{read_id}.bed"
  conda:
    "envs/aligner.yml"
    #add python and r-base to aligner or create a new env
  shell:
    "python scripts/genomCov2bed.py {input.plus} + {output.plus} && \
    python scripts/genomCov2bed.py {input.minus} + {output.minus}"
