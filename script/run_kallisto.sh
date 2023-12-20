#!/bin/sh

module load python3.9-anaconda
#module load Bioinformatics
#module load kallisto


while getopts ":g:a:s:o:b:x:" j; do
    case "${j}" in
    g)
        genome_path=$OPTARG
        ;;
    a)
        gtf_path=$OPTARG
        ;;
    s)
        save_path=$OPTARG
        ;;
    o)
        output_path=$OPTARG
        ;;
    b)
        batch_path=$OPTARG
        ;;
    x)
        technology=$OPTARG
        ;;
    esac
done
#echo "The value of index_path is: $save_path"
#echo "The value of index_path is: $gtf_path"

index_path=$save_path/index.idx
t2g_path=$save_path/t2g.txt

if [ -e "$index_path" ] && [ -e "$t2g_path" ]; then
    echo "Index and t2g files already exist. Skipping kb ref command."
else
    echo "Running kb ref command."
    kb ref -i "$index_path" -g "$t2g_path" -f1 "$save_path/transcriptome.fa" "$genome_path" "$gtf_path"
fi

#kb ref -i $index_path -g $g2t_path -f1 $save_path/transcriptome.fa $genome_path $gtf_path 

if [ -e "$output_path" ]; then
    kb count -i $index_path -g $t2g_path --overwrite --h5ad --tcc -t 4 -x $technology -o $output_path --parity paired  --verbose $batch_path -m 8G
else
    echo "Error: no output path"
fi

