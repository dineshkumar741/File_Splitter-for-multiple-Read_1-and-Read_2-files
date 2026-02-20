# File_Splitter-for-multiple-Read_1-and-Read_2-files
Splitting FASTQ files

This Workflow merges multiple paired-end FASTQ chunks (R1 and R2) into a single compressed FASTQ pair per sample. It is designed for datasets split across multiple files e.g., sequencing chunks.

It combines multiple R1 & R2 files into one final R1 & R2 FASTQ file per sample. It automatically detects,groups and concatenate chunks into one compressed file. 

# Input 

File follow naming patter: 

*_R1_fastq.gz
*_R2_fastq.gz

# Output

sample_ID_R1.fastq.gz
sample_ID_R2.fastq.gz

Output files are saved into a dedicated output directory.
