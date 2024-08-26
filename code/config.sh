if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Run with the defaults."
fi

if [ -z "${1}" ]; then
  num_threads=$(get_cpu_count)
else
  if [ "${1}" -gt $(get_cpu_count) ]; then
    echo "Requesting more threads than available. Setting to Max Available."
    num_threads=$(get_cpu_count)
  else
    num_threads="${1}"
  fi
fi

if [ -z "${2}" ]; then
    genomeFastaFiles=$(get_fasta_file --dir ../data)
else
    genomeFastaFiles="${2}"
fi

if [ -z "${3}" ]; then
    sjdbGTFfile=$(find -L ../data -name "*.gtf*")
else
    sjdbGTFfile="${3}"
fi

if [ -z "${4}" ]; then
    readFilesCommand="zcat"
else
    readFilesCommand="${4}"
fi


if [ -z "${5}" ]; then
    genomeSAindexNbases=14
else
    genomeSAindexNbases="${5}"
fi

if [ -z "${6}" ]; then
    sjdbOverhang=100
else
    sjdbOverhang="${6}"
fi


if [ -z "${7}" ]; then
    output_dir="../results/star_index"
else
    output_dir="${7}"
fi
