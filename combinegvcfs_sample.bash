#!/bin/bash

#SBATCH --job-name=Genomics_DB
#SBATCH --cpus-per-task=8
#SBATCH --ntasks=1-4
#SBATCH --mem-per-cpu=8000
#SBATCH --partition=assemble1,assemble3,assemble2,blades
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch
#SBATCH --output=GenomicsDB__%A_%a.std
#SBATCH --error=GenomicsDB__%A_%a.err


module load gatk/4.1.2.0

date

gatk --java-options "-Xmx64g" CombineGVCFs \
 -R /mnt/nfs/nfs4/ravi.kumar/SAMtoFASTq/GCF_003369695.1_UOA_Brahman_1_genomic_GATK.fna \
 -V sample_1_annota.g.vcf.gz \
 -V sample_2_annota.g.vcf.gz \
 -V sample_3_annota.g.vcf.gz \
 -V sample_4_annota.g.vcf.gz \
 -O cohort_sample.g.vcf.gz

date


