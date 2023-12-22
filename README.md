# Predicting the Structural Impact of Human Alternative Splicing

This repository contains code and resources related to the project on predicting the structural impact of human alternative splicing.

Instruction on running the notebooks and scripts:

/script/run_alphafold.sh is used to run the protein structure predictions, for a protein around 300 amino acids, it should take between 30 minutes to several hours depending on the computational resources you used. Reference: https://github.com/kalininalab/alphafold_non_docker (Author: Sanjay Kumar Srikakulam)

/script/generate_batch.sh is to generate a txt file contains all the paired fastq files as the input for kb-python, which is useful when dealing with smartseq2 data

/script/run_kallisto.sh is a simple bash script used for used to run the kb-python on scRNA-seq data from the raw fastq file to generate a count matrix 

  
