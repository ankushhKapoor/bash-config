# ls extended for size, creation date time of each file shown using ls
lsx() {
  local files=()
  if [[ "$1" == "-a" ]]; then
    shift
    # list hidden + visible files in given dir or current dir if none given
    local dir="${1:-.}"
    # glob hidden and visible files, skip . and ..
    files=( "$dir"/.* "$dir"/* )
  else
    local dir="${1:-.}"
    files=( "$dir"/* )
  fi

  for file in "${files[@]}"; do
    # skip "." and ".."
    base=$(basename "$file")
    if [[ "$base" == "." || "$base" == ".." ]]; then
      continue
    fi
    if [ ! -e "$file" ]; then
      continue
    fi
    ctime=$(stat -c %W "$file")
    size=$(stat -c %s "$file")
    if [ "$ctime" -gt 0 ]; then
      printf "%-20s %12s bytes  Created: %s\n" "$base" "$size" "$(date -d @"$ctime" "+%d-%m-%Y %H:%M")"
    else
      printf "%-20s %12s bytes  Created: Unknown\n" "$base" "$size"
    fi
  done
}
