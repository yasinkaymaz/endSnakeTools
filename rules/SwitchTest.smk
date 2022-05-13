rule SwitchTest:
    input:
      bedFile="test.bed",
      outFile="outfile",
      NoC1="0"#number,
      NoC2="0"#number,
      outDir="path/to/outdir"
    output:
      "UTR_Length_Shorthening.pdf",
      "UTRlen.txt",
      "3utr_CPM.bed"
    params:
      #some selection for which script to run (v1,v2,v3 or v4)
    conda:
      rbase.yml
    shell:
      "Rscript scripts/PASseq_chisquire_beta_v3.R {input.bedFile} {input.outFile} {input.NoC1} {input.NoC2} {input.outDir}" #placeholder Rscript
    
      
