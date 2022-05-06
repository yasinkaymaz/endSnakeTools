rule NBclassifier:
    input:
        bed = 'mergedbed/{read_id}_merged.bed',
        script: "Rscripts/cleanUpdTSeq.R"
    output:
        "NB_output/{read_id}.nbpred"
    log:
        "logs/NBclassifier/{read_id}.log"
    shell:
        "Rscript {input.script} {input.bed} {output} {organism}

