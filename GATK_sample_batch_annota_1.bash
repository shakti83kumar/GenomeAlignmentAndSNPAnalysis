#!/bin/bash

#SBATCH --job-name=GATK-
#SBATCH --cpus-per-task=4
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=16000
#SBATCH --array=1-4
#SBATCH --partition=blades,assemble1,assemble2,assemble3
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch
#SBATCH --output=GATK__%A.std
#SBATCH --error=GATK__%A.err

module load gatk/4.1.2.0

date

gatk --java-options "-Xmx64G" HaplotypeCaller \
 -R /mnt/nfs/nfs4/ravi.kumar/SAMtoFASTq/GCF_003369695.1_UOA_Brahman_1_genomic_GATK.fna \
 -I marked_duplicates_sample_1.bam \
 -O sample_1_annota.g.vcf.gz \
 -ERC GVCF \
 -G StandardAnnotation \
 -G AS_StandardAnnotation

date



