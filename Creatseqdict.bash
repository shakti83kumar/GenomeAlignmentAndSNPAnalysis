#!/bin/bash

#SBATCH --job-name=Createdict
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4000
#SBATCH --partition=assemble2
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/SAMtoFASTq
#SBATCH --output=CD__%A.std
#SBATCH --error=CD__%A.err


date

module load picard/2.9.2



java -jar picard.jar CreateSequenceDictionary \
R=GCF_003369695.1_UOA_Brahman_1_genomic_GATK.fna \
O=GCF_003369695.1_UOA_Brahman_1_genomic_GATK.fna.dict

date

