rule clusterPeaks:
    input:
      cluster_dist="10"
      bed="file.bed"
      NBfile="file.nbpred"
    output:
      "{input.bed}.TruePeaks"
    params:
      organism="human"
    conda:
      "new_env.yml"
    shell:
      "sh scripts/cluster.sh {input.cluster_dist {input.bed} {input.NBfile}"
