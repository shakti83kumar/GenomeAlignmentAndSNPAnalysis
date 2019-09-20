#!/bin/bash

#SBATCH --job-name=mpileup-
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1-4
#SBATCH --mem-per-cpu=128000
#SBATCH --partition=assemble1,assemble2,assemble3,blades
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch
#SBATCH --output=mpileup__%A.std
#SBATCH --error=mpileup__%A.err

date

module load bcftools/1.9


bcftools mpileup \
-f /mnt/nfs/nfs4/ravi.kumar/SAMtoFASTq/GCF_003369695.1_UOA_Brahman_1_genomic_GATK.fna \
 marked_duplicates_sample_1.bam \
 marked_duplicates_sample_2.bam \
 marked_duplicates_sample_3.bam \
 marked_duplicates_sample_4.bam | \
 bcftools call -mv -Ob -o sample_combined_mpileup.bcf

date





