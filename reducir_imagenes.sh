#!/data/data/com.termux/files/usr/bin/bash
input_dir="$1"
output_dir="$2"
mkdir -p "$output_dir"
for img in "$input_dir"/*.{jpg,jpeg,png,webp}; do
  [ -e "$img" ] || continue
  filename=$(basename "$img")
  convert "$img" -resize 1080x1080 -strip -quality 75 -define jpeg:extent=299KB "$output_dir/$filename"
done
