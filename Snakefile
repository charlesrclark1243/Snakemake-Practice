rule copy_hello_world:
    input:
        input_file="data/input.txt"
    output:
        output_file="out/output.txt"
    shell:
        "cp {input.input_file} {output.output_file}"

rule clean:
    shell:
        "rm -rf out/"

rule bwa_index:
    input:
        ref="data/allvirusgenomes_poly-a_removed_hand_edit.fasta"
    output:
        ref_index="data/allvirusgenomes_poly-a_removed_hand_edit.fasta.bwt"
    shell:
        "bwa index {input.ref}"

rule bwa_map:
    input:
        ref="data/allvirusgenomes_poly-a_removed_hand_edit.fasta",
        ref_index="data/allvirusgenomes_poly-a_removed_hand_edit.fasta.bwt",
        reads="data/FAW39815_pass_barcode01_dd0cc9b2_0.fastq"
    output:
        "out/mapped_reads.bam"
    shell:
        "bwa mem {input.ref} {input.reads} | samtools view -Sb - > {output}"