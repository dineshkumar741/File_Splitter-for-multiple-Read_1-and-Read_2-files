nextflow.enable.dsl=2


params.reads_dir = "/media/ricky/EXTERNAL_USB/redamane_data/merged_chunks/"

process merged_fastq {
    tag "$sample_id"
    publishDir "merged_fastq", mode: 'copy'

    input:
    
    tuple val(sample_id), path(reads, stageAs: "?/*")

    output:
    tuple val(sample_id), path("${sample_id}_R1.fastq.gz"), path("${sample_id}_R2.fastq.gz")

    script:
    """
    find . -maxdepth 2 -name "*_R1_*" | sort | xargs cat > ${sample_id}_R1.fastq.gz
    find . -maxdepth 2 -name "*_R2_*" | sort | xargs cat > ${sample_id}_R2.fastq.gz
    """
}

workflow {
    
    reads_ch = Channel.fromFilePairs("${params.reads_dir}/**/*_R{1,2}*.fastq.gz", size: -1) { file ->
        file.parent.name
    }

    merge_to_one_pair(reads_ch)
}

