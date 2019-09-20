#!/bin/bash

#SBATCH --job-name=BAM_index_MD
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=16000
#SBATCH --array=1-4
#SBATCH --partition=assemble3,blades,assemble2,assemble1
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch
#SBATCH --output=Markduplicates10__%A.std
#SBATCH --error=Markduplicates10__%A.err




module load picard/2.20.0

date

java -Xmx16G -jar picard.jar BuildBamIndex \
I=marked_duplicates_sample_2.bam

date



