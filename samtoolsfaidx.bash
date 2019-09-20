#!/bin/bash

#SBATCH --job-name=Samtoolsfaidx-
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=8000
#SBATCH --partition=assemble1
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/SAMtoFASTq
#SBATCH --output=SAMfaidx__%A.std
#SBATCH --error=SAMfaidx__%A.err

date

module load samtools


samtools faidx GCF_003369695.1_UOA_Brahman_1_genomic_GATK.fna 

date




