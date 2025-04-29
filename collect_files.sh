#!/bin/bash
input_dir="$1"
output_dir="$2"
declare -A file_count

uni_name() {
    local filename="$1"
    local base="${filename%.*}"
    local ext="${filename##*.}"
    local counter=1
    local new_name="$filename"
    while [[ -e "$output_dir/$new_name" || -n "${file_count[$new_name]}" ]]; do
        if [[ "$base" == "$ext" ]]; then
            new_name="${base}_${counter}"
        else
            new_name="${base}_${counter}.${ext}"
        fi
        ((counter++))
    done

    file_count["$new_name"]=1
    echo "$new_name"
}
find "$input_dir" -type f | while read -r filepath; do
  filename=$(basename "$filepath")
  n_name=$(uni_name "$filename")
  cp "$filepath" "$output_dir/$n_name"
done
