#!/bin/bash

#SBATCH --job-name=FreeBayes_
#SBATCH --cpus-per-task=2
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=128000
#SBATCH --partition=assemble1,assemble2,assemble3,blades
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch
#SBATCH --output=FreeBayes__%A.std
#SBATCH --error=FreeBayes__%A.err

date

module load freebayes/1.1.0-1-gf15e66e


freebayes \
 -f /mnt/nfs/nfs4/ravi.kumar/SAMtoFASTq/GCF_003369695.1_UOA_Brahman_1_genomic_GATK.fna \
 marked_duplicates_sample_1.bam \
 marked_duplicates_sample_2.bam \
 marked_duplicates_sample_3.bam \
 marked_duplicates_sample_4.bam  >sample_combined_freeBayes.vcf


date

