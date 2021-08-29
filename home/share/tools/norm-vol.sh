#!/bin/bash

[ "${#@}" -lt 2 ] && {
	echo "$0 input_dir output_dir"
	exit 1
}

indir=$1
outdir=$2

[ "$(readlink -m "$1")" = "$(readlink -m "$2")" ] && {
	echo "input dir can't be the same as output dir"
	exit 1
}

mkdir -pv "$outdir"

nproc=$(grep -c '^processor' /proc/cpuinfo)

while read -r f; do
	echo "Normalize Volume of $f"
	ofile="$outdir/${f#*/}"
	mkdir -pv "$(dirname "$ofile")"

	ffmpeg-normalize -f "$f" -c:a mp3 -b:a 192k -o "$ofile" &

	while [ "$(pgrep -lf "ffmpeg-normalize" | wc -l)" -ge "$nproc" ]; do
		sleep 1s;
	done
	sleep 0.2s
done < <(find "$indir" -maxdepth 2 -type f -print)

