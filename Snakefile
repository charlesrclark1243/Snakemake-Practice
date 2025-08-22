rule copy_hello_world:
    input:
        "data/input.txt"
    output:
        "out/output.txt"
    shell:
        "cp {input} {output}"

rule clean:
    shell:
        "rm -rf out/"