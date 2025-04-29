#!/bin/bash
input_dir="$1"
output_dir="$2"

find "$input_dir" -type f | while read -r file; do
  filename=$(basename "$file")
  cp "$file" "$output_dir/$filename"
done
