rule rnafusioncleanup:
        input:  expand("{name}.RnaSeqMetrics.txt",name=samples),
                "RawCountFile_genes_filtered.txt",
                "RawCountFile_junctions_filtered.txt",
                "RawCountFile_genejunctions_filtered.txt",
                expand("{name}.star.count.overlap.txt",name=samples),
                "RawCountFileOverlap.txt",
                "RawCountFileStar.txt",
                expand("{name}.rsem.genes.results",name=samples),
                expand("{x}.R1.fastq.gz", x=samples),
                "RawCountFile_rsemgenes_filtered.txt",
        output: expand("expression/{name}.RnaSeqMetrics.txt",name=samples),
                "expression/RawCountFile_genes_filtered.txt",
                "expression/RawCountFile_junctions_filtered.txt",
                "expression/RawCountFile_genejunctions_filtered.txt",
                expand("expression/{name}.star.count.overlap.txt",name=samples),
                "expression/RawCountFileOverlap.txt",
                "expression/RawCountFileStar.txt",
                expand("expression/{name}.rsem.genes.results",name=samples),
                "expression/RawCountFile_rsemgenes_filtered.txt",
        params: rname="pl:clean"
        shell:  "mv *_genecounts.txt expression/; mv *_gencodeintersects.txt expression/; mv gencode.gtf.filler.bed expression/; mv *SJ.out.bed.recoded.tab expression/; mv *.rsem.stat expression/; mv *_STARgenome expression/; mv *junctions.txt expression/; mv *.rsem.time expression/; mv *.rsem.isoforms.results expression/; mv *.star_rg_added.sorted.dmark.bai expression/; mv *.star.duplic expression/; mv *.star.count.info.overlap.txt.summary expression/; mv *.star.count.info.txt.summary expression/; mv *.star.count.info.overlap.txt expression/; mv *.star.count.txt expression/; mv *.star.count.info.txt expression/; mv HistBeforenormFilter.png expression/; mv RawCount_genes_unfiltered.txt expression/; mv *_counts.txt expression/; mv *.InsertSizeMetrics.txt expression/; mv *.InsertSizeHisto.pdf expression/; mv *.flagstat.concord.txt expression/; mv *filtered.txt expression/; mv *.RnaSeqMetrics.txt expression/; mv *.star.count.overlap.txt expression/; mv RawCountFileOverlap.txt expression/; mv RawCountFileStar.txt expression/; mv *.rsem.genes.results expression/"