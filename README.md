# TaME-seq
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) 

Introduction
------------
TaME-seq snakemake workflow provides a bioinformatics solution for TaME-seq lab protocol.


Installation
------------
To install this workflow, clone the repo:

```
git clone https://github.com/sinanugur/TaME-seq.git
cd TaME-seq

```

Setting up
------------
Install the conda environnement:

```
conda env create -f envs/snakemake5.yml 

```

The correct location of uncle_psl.py needs to be edited in Snakefile_snakemake5 (default: "/home/miniconda3/envs/snakemake5/bin/uncle_psl.py").

The raw data goes to: "/data/raw/group/"

The reference genome goes to: "/data/ref_genome/" and ndexes for the refrence genome needs to be created, see "/data/ref_genome/README.txt"

Run the pipeline with:

```
snakemake -j 16 -p -s ./Snakefile_snakemake5 --config directory=group
```
