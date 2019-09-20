#!/bin/bash

#SBATCH --job-name=GenotypeGVCFs
#SBATCH --cpus-per-task=2
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=64000
#SBATCH --partition=assemble1,assemble2,blades,assemble3
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/Girbatch
#SBATCH --output=GenotypeGVCFs__%A_%a.std
#SBATCH --error=GenotypeGVCFs__%A_%a.err


module load gatk/4.1.2.0

date

gatk --java-options "-Xmx64g -Xms64g" GenotypeGVCFs \
 -R /mnt/nfs/nfs4/ravi.kumar/SAMtoFASTq/GCF_003369695.1_UOA_Brahman_1_genomic_GATK.fna \
 -V cohort_sample.g.vcf.gz \
 -O Genotyped_sample.vcf.gz

date

