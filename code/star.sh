#!/usr/bin/env bash
set -e

source ./config.sh

echo "Using threads: $num_threads"
echo "Input Fasta: $genomeFastaFiles"
echo "Input GTF: $sjdbGTFfile"

cd ../results

STAR_FASTA=$(basename $genomeFastaFiles)
STAR_SJDBGTF=$(basename $sjdbGTFfile)

#for some reason readFilesCommand is not applied during index generation, so we're doing it manually
$readFilesCommand "$genomeFastaFiles" > $STAR_FASTA

$readFilesCommand "$sjdbGTFfile" > $STAR_SJDBGTF

STAR \
    --runThreadN "$num_threads" \
    --runMode genomeGenerate \
    --genomeDir "$output_dir" \
    --genomeFastaFiles $STAR_FASTA \
    --sjdbGTFfile $STAR_SJDBGTF \
    --sjdbOverhang "$sjdbOverhang" \
    --genomeSAindexNbases "$genomeSAindexNbases"

rm $STAR_FASTA
rm $STAR_SJDBGTF