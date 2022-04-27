configfile : "config/config.yaml"


include: "rules/cutadapt_trimPolyA_T.smk"
#include: "rules/prinseq_trimPolyA_T.smk"
include: "rules/genomeAlign.smk"

rule all:
    input:
        #expand("prinseq/SE_trimmed_{read_id}.fastq",read_id= config["read_id"]),
        expand("cutadapt/SE_trimmed_{read_id}.fastq",read_id=config["read_id"]),
        expand("aligned_reads/aligned_{read_id}.sam",read_id=config["read_id"]),