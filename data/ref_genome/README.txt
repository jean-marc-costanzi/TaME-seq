Place the reference genome file in this folder.
Several files needs to be created from the fasta reference genome file.

Building indexes:
$ hisat2-build -p 16 genome.fasta genome
$ samtools faidx genome.fasta

Prepare lastal reference files:
$ lastdb genome_lastaldb genome.fasta
