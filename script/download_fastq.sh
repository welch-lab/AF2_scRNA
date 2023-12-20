#!/bin/bash



while getopts ":a:d:s:" i; do
    case "${i}" in
    a)
        aws_path=$OPTARG
	;;
    d)
	download_path=$OPTARG
        ;;
    s)
        save_path=$OPTARG
        ;;
    esac
done
$aws_path s3 cp --recursive $download_path $save_path

