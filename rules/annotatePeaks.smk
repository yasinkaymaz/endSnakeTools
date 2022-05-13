#This step runs an external bash script in ./scripts/ called "annotate.sh".
#Downdist- Additional distance range downstream of 3'UTR regions to annotate peaks, integer (Default is 1000, 1Kb).
rule annotatePeaks:
    input:
      truePeaksBed = "bed_files/truepeaks.bed"
    output:
      "Introns_GB.bed"
    params:
      downDist = 1000
    shell:
        "scripts/annotate.sh {input.truePeaksBed} {organism} {params.downDist}"
    
      
