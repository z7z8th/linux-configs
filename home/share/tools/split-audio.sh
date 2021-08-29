#!/bin/bash

[ "${#@}" -lt 2 ] && {
	echo "$0 input_file output_dir"
	exit 1
}

inf=$1
outdir=$2

get_duration()
{
	local dur
	dur=$(ffmpeg -i "$1" 2>&1 | sed -E -n -e '/Duration:/{s/Duration: ([0-9:.]+).*/\1/;p;q;}')
	echo "Duration: $dur" >&2
	echo "$dur"
}

dur_to_sec()
{
	local h
	local m
	local s
	h=$(echo "$1" | awk -F: '{print $1}')
	m=$(echo "$1" | awk -F: '{print $2}')
	s=$(echo "$1" | awk -F: '{print $3}' | sed -E -e 's/\.[0-9]+$//')
	# echo $s >&2
	local sec=$((h*3600+m*60+s))
	echo "Seconds: $sec" >&2
	echo "$sec"
}

sec=$(dur_to_sec "$(get_duration "$inf")")

outfbase=$(basename "$inf" | sed -E -e 's/[\. ]([0-9]{3,4}p)[\. ].*$//')
outfbase="$outdir/$outfbase"

nproc=$(grep -c '^processor' /proc/cpuinfo)

for ((i=0; i<sec; i+=600)); do
	ffmpeg -y -i "$inf" -ss "$i" -to "$((i+600))" -c:a mp3 -b:a 192k "$outfbase-p$((i/600)).mp3" &

	while [ "$(pgrep -lf "ffmpeg[ \t]" | wc -l)" -ge "$nproc" ]; do
		sleep 1s;
	done
done
