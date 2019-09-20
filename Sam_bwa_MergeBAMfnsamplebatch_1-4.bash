#!/bin/bash

#SBATCH --job-name=Sam_bwa_MergeBAM
#SBATCH --cpus-per-task=8
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=16000
#SBATCH --array=1-4
#SBATCH --partition=assemble3,assemble2,assemble1,blades
#SBATCH --workdir=/mnt/nfs/nfs4/ravi.kumar/Trainingbatch
#SBATCH --output=__%A_%a.std
#SBATCH --error=Sam_bwa_Merge__%A_%a.err


date

module load picard/2.9.2
module load bwa/0.7.15-r1142


java -Dsamjdk.buffer_size=131072 -Dsamjdk.compression_level=1 -XX:GCTimeLimit=50 -XX:GCHeapFreeLimit=10 -Xmx8G -jar picard.jar SamToFastq \
I=MarkIlluminaAdapters_sample_${SLURM_ARRAY_TASK_ID}.bam \
FASTQ=/dev/stdout \
CLIPPING_ATTRIBUTE=XT \
CLIPPING_ACTION=2 \
INTERLEAVE=true \
NON_PF=true \
TMP_DIR=/mnt/nfs/nfs4/ravi.kumar | \
bwa mem /mnt/nfs/nfs4/ravi.kumar/SAMtoFASTq/GCF_003369695.1_UOA_Brahman_1_genomic.fna.gz /dev/stdin -t 32 -p -M | \
java -Dsamjdk.buffer_size=131072 -Dsamjdk.compression_level=1 -XX:GCTimeLimit=50 -XX:GCHeapFreeLimit=10 -Xmx16G -jar picard.jar MergeBamAlignment \
ALIGNED=/dev/stdin \
UNMAPPED=unaligned_read_pairs_sample_${SLURM_ARRAY_TASK_ID}.bam \
O=merge_alignments_sample_${SLURM_ARRAY_TASK_ID}.bam \
R=/mnt/nfs/nfs4/ravi.kumar/SAMtoFASTq/GCF_003369695.1_UOA_Brahman_1_genomic.fna.gz CREATE_INDEX=true ADD_MATE_CIGAR=true \
CLIP_ADAPTERS=false CLIP_OVERLAPPING_READS=true \
INCLUDE_SECONDARY_ALIGNMENTS=true MAX_INSERTIONS_OR_DELETIONS=-1 \
PRIMARY_ALIGNMENT_STRATEGY=MostDistant ATTRIBUTES_TO_RETAIN=XS \
TMP_DIR=/mnt/nfs/nfs4/ravi.kumar

date

