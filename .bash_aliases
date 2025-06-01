# lsx: Extended ls command to show size and creation date of files/folders
lsx() {
  local files=()            # Array to hold file paths
  local total_size=0        # To store total size of listed files/folders

  # If first argument is -a, include hidden files
  if [[ "$1" == "-a" ]]; then
    shift
    # Use given dir or current dir if not provided
    local dir="${1:-.}"
    # Include both hidden and visible files (except . and ..)
    files=( "$dir"/.* "$dir"/* )
  else
    local dir="${1:-.}"
    # Only include visible files
    files=( "$dir"/* )
  fi

  # First pass: Calculate total size
  for file in "${files[@]}"; do
    base=$(basename "$file")

    # Skip . and ..
    if [[ "$base" == "." || "$base" == ".." ]]; then
      continue
    fi

    # Skip if file does not exist (broken symlinks or empty glob)
    if [ ! -e "$file" ]; then
      continue
    fi

    # If it's a directory, use du -sb to get total size of contents
    if [ -d "$file" ]; then
      size=$(du -sb "$file" | cut -f1)
    else
      # If it's a regular file, get size using stat
      size=$(stat -c %s "$file")
    fi

    # Add to total
    total_size=$((total_size + size))
  done

  # Print total size summary at the top
  echo "Total: $total_size bytes"

  # Second pass: Show detailed info per file
  for file in "${files[@]}"; do
    base=$(basename "$file")

    # Again skip . and ..
    if [[ "$base" == "." || "$base" == ".." ]]; then
      continue
    fi

    # Skip if file doesn't exist
    if [ ! -e "$file" ]; then
      continue
    fi

    # Get creation time (birth time) if available
    ctime=$(stat -c %W "$file")

    # Get size based on type (folder or file)
    if [ -d "$file" ]; then
      size=$(du -sb "$file" | cut -f1)
    else
      size=$(stat -c %s "$file")
    fi

    # Format and print output
    if [ "$ctime" -gt 0 ]; then
      printf "%-20s %12s bytes  %s\n" "$base" "$size" "$(date -d @"$ctime" "+%d-%m-%Y %H:%M")"
    else
      printf "%-20s %12s bytes  Unknown\n" "$base" "$size"
    fi
  done
}
