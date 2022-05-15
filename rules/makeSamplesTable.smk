rule makeSamplesTable:
    input:
      smp="samples.file"
      gtf="annotation.file"
    output:
      ""
    conda:
      new_env.yml #need to add an env with bedtools,R and python
    shell:
      "sh {script.sh} {input.smp} {input.gtf}"
