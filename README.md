# STAR Index

Generates index for use in STAR RNA alignment. See [STAR Manual](https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf) for more details.

Index generation is a memory heavy process and requires ~10x reference genome file size RAM, so it is best to use a dedicated instance. Increasing the number of cores does not increase speed dramatically, so as long as there is enough memory it'll run more or less the same on many cores or a few. 

hg38 takes ~40 minutes on 8 cores / 64 GB

## Input data

Fasta file

Genome reference file. If not specified, first \*.fasta (\*.fna, \*.fa etc.) in **data** directory is used. Optionally gzipped. 

Annotation file

GTF containing gene annotations corresponding to fasta file. If not specified, first \*.gtf\* in **data** is used. Optionally gzipped.

## Outputs

STAR index, which saves the reference sequence and splice annotations in its own internal format. Associated files: 
- Index directory
    - chrLength.txt
    - chrName.txt
    - chrNameLength.txt
    - chrStart.txt
    - exonGeTrInfo.tab
    - exonInfo.tab
    - geneInfo.tab
    - Genome
    - genomeParameters.txt
    - SA
    - SAindex
    - sjdbInfo.txt
    - sjdbList.fromGTF.out.tab
    - transcriptInfo.tab
    
## App Panel Parameters

Threads 
-Number of threads used by STAR. If not set will use all available. Note that more threads won't necessarily speed up genome creation [default: None]

Reference Path
- Reference fasta file to be used. If not specified, will use first fasta file discovered. [default: None]

Annotation file
- GTF containing gene annotations corresponding to fasta file. Note: Chromosome names must be the same (so use care when mixing Ensembl and UCSC.) Optionally gzipped. If not specified, first \*gtf* file will be used [default: None]

Read files command
- Unzip command to read fastq files. For gzipped, this would be "zcat", for unzipped, "cat" for bgzipped it would be "bunzip2 -c" **NOTE: IF YOU HAVE UNCOMPRESSED DATA BE SURE TO CHANGE THIS TO cat!** [default: zcat]

Length (bases) of the SA pre-indexing string
- genomeSAindexNbases, : length (bases) of the SA pre-indexing string. Typically between 10 and 15. Longer strings will use much more memory, but allow faster searches. For small
genomes, the parameter –genomeSAindexNbases must be scaled down to
min(14, log2(GenomeLength)/2 - 1). Default is 14, but with a smaller genome (i.e., yeast) use 12. [default: 14]

Length of sequence on either side of junctions
- sjdbOverhang parameter, length of the donor/acceptor sequence on each side of the junctions, ideally = (read length - 1). [default: 100] 


Output directory: Location to save STAR index. [default: ../results/star_index]
