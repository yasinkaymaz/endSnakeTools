configfile : "config.yaml"
read_id= config["read_id"]
genome_prefix = config["indexed_genome"]

rule all:
    input:
        expand("cutadapt/SE_trimmed_{read_id}.fastq",read_id= config["read_id"]),
        expand("aligned_reads/aligned_{read_id}.sam",read_id= config["read_id"])

include: "rules/cutadapt_trimPolyA_T.smk"
#include: "rules/prinseq_trimPolyA_T.smk"
include: "rules/genomeAlign.smk"




