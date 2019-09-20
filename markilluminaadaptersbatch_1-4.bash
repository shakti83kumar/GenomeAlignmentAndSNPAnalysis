#!/bin/bash

#SBATCH --job-name=MarkIlluminaAdapters
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=8000
#SBATCH --array=1-4
#SBATCH --partition=assemble1,assemble2,assemble3,blades
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch
#SBATCH --output=Markillumina__%A_%a.std
#SBATCH --error=Markillumina__%A_%a.err


module load picard/2.9.2

date

java -jar picard.jar MarkIlluminaAdapters \
INPUT=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch/unaligned_read_pairs_sample_${SLURM_ARRAY_TASK_ID}.bam \
OUTPUT=MarkIlluminaAdapters_sample_${SLURM_ARRAY_TASK_ID}.bam \
METRICS=MarkIlluminaAdapters_sample_${SLURM_ARRAY_TASK_ID}.txt \
ADAPTERS=null \
FIVE_PRIME_ADAPTER=GATCGGAAGAGCACACGTCTGAACTCCAGTCdUACACTCTTTCCCTACACGACGCTCTTCCGATC \
THREE_PRIME_ADAPTER=GATCGGAAGAGCACACGTCTGAACTCCAGTCdUACACTCTTTCCCTACACGACGCTCTTCCGATC

date

