#!/bin/bash

#SBATCH --job-name=Fastqtosam
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=8000
#SBATCH --array=1,2
#SBATCH --partition=assemble2,assemble3,assemble1,blades
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch
#SBATCH --output=Fastqtosam__%A_%a.std
#SBATCH --error=Fastqtosam__%A_%a.err

module load picard/2.9.2

date

java -Xmx8G -jar picard.jar FastqToSam \
F1=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch/sample${SLURM_ARRAY_TASK_ID}_R1.fastq.gz \
F2=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch/sample${SLURM_ARRAY_TASK_ID}_R2.fastq.gz \
O=unaligned_read_pairs_sample_${SLURM_ARRAY_TASK_ID}.bam \
SM=sample_${SLURM_ARRAY_TASK_ID} \
RG=HYVY5_${SLURM_ARRAY_TASK_ID} \
LB=libsample${SLURM_ARRAY_TASK_ID} \
TMP_DIR=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch

date

