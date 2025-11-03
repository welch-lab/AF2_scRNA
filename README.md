# Predicting the Structural Impact of Human Alternative Splicing

![workflow](docs/img/workflow.png)

This repository contains code and resources related to the project on predicting the structural impact of human alternative splicing.

## Instruction on running the notebooks and scripts:

/script/run_alphafold.sh is used to run the protein structure predictions, for a protein around 300 amino acids, it should take between 30 minutes to several hours depending on the computational resources you used. Reference: https://github.com/kalininalab/alphafold_non_docker (Author: Sanjay Kumar Srikakulam).

/script/generate_batch.sh is to generate a txt file contains all the paired fastq files as the input for kb-python, which is useful when dealing with smartseq2 data.

/script/run_kallisto.sh is a simple bash script used for used to run the kb-python on scRNA-seq data from the raw fastq file to generate a count matrix. 

notebooks are used for reproduce main figures in the paper.

Predicted reference and isoform structures are stored in figshare (DOI: 10.6084/m9.figshare.24891870), processed human scRNA-seq dataset for is stored in figshare (DOI: 10.6084/m9.figshare.24843948), function prediction results are stored in figshare (DOI: 10.6084/m9.figshare.24891897)

## Citation

>[Yuxuan Song, Chengxin Zhang, Gilbert S Omenn, Matthew James O'Meara, Joshua D. Welch, Predicting the Structural Impact of Human Alternative Splicing, 2023, bioRxiv](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-025-03744-x)
