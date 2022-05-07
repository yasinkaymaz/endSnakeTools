import sys

def genomCov2bed(GenCov, strand, Bed):
    """
    #Input: Output file of genomeCoverage from BedTools
    #Arguments:
    #User options:
    #Output(s): Bedformat
    """
    fileGenCov = open('%s' %GenCov, "r")
    fileBed = open('%s' %Bed, "w")
    peakid = 0
    for linex in fileGenCov:
        peakid = peakid +1
        end = int(linex.strip().split("\t")[1]) + 1
        if strand == 'minus':
            strd = '-'
        else:
            strd = '+'
        #This step filters single coverage locations.
        if int(float(linex.strip().split("\t")[2])) > 1:
            fileBed.write(linex.strip().split("\t")[0]+"\t"+linex.strip().split("\t")[1]+"\t"+str(end)+"\t"+'%s' %strand+str(peakid)+"\t"+linex.strip().split("\t")[2]+"\t"+'%s' %strd+"\n")
        else:
            pass
    peakid = 0
    fileGenCov.close()
    fileBed.close()

genomCov2bed(sys.argv[1],sys.argv[2],sys.argv[3])
