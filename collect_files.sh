#!/bin/bash
input_dir="$1"
outut_dir="$2"

find "$input_dir" -name '*txt' -exec cp {} "$output_dir" \;
