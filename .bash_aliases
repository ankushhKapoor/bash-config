# lsx: Extended ls command to show size and creation date of files/folders
lsx() {
  local files=()            # Array to hold file paths
  local total_size=0        # To store total size of listed files/folders
  local dir                 # Directory to inspect

  # Check if -a flag is used (for showing hidden files)
  if [[ "$1" == "-a" ]]; then
    shift
    dir="${1:-.}"
    shift
  else
    dir="${1:-.}"
  fi

  # Check if directory exists
  if [ ! -d "$dir" ]; then
    echo "lsx: '$dir' - No such directory exists"
    return 1
  fi

  # Expand hidden + visible files
  if [[ "$1" == "-a" ]]; then
    files=( "$dir"/.* "$dir"/* )
  else
    files=( "$dir"/* )
  fi

  # First pass: Calculate total size
  for file in "${files[@]}"; do
    base=$(basename "$file")

    if [[ "$base" == "." || "$base" == ".." ]]; then
      continue
    fi
    if [ ! -e "$file" ]; then
      continue
    fi

    if [ -d "$file" ]; then
      size=$(du -sb "$file" | cut -f1)
    else
      size=$(stat -c %s "$file")
    fi

    total_size=$((total_size + size))
  done

  echo "Total: $total_size bytes"

  # Second pass: Show details
  for file in "${files[@]}"; do
    base=$(basename "$file")

    if [[ "$base" == "." || "$base" == ".." ]]; then
      continue
    fi
    if [ ! -e "$file" ]; then
      continue
    fi

    ctime=$(stat -c %W "$file")
    if [ -d "$file" ]; then
      size=$(du -sb "$file" | cut -f1)
      suffix="/"
    elif [ -x "$file" ]; then
      size=$(stat -c %s "$file")
      suffix="*"
    else
      size=$(stat -c %s "$file")
      suffix=""
    fi

    if [ "$ctime" -gt 0 ]; then
      printf "%-20s %12s bytes  %s\n" "$base$suffix" "$size" "$(date -d @"$ctime" "+%d-%m-%Y %H:%M")"
    else
      printf "%-20s %12s bytes  Unknown\n" "$base$suffix" "$size"
    fi
  done
}
