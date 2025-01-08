#!/bin/bash
#
# Rename all files inside a directory with the following rules:
# - Replace whitespaces with underscores.
# - Remove characters that are not alphanumerics, hyphens, underscores, or dots.
# - If a filename ends with ".sh" and is executable, remove the ".sh" extension.

for file_name in *; do
  # Check if the file ends with ".sh" and is executable
  if [[ "$file_name" == *.sh && -x "$file_name" ]]; then
    # Remove the ".sh" extension
    new_file_name="${file_name%.sh}"
  else
    # Replace whitespace with underscores and remove any characters that are
    # not alphanumerics, underscores, hyphens, or dots.
    new_file_name=$(echo "$file_name" | tr ' ' _ | sed -E 's/[^[:alnum:]_.-]+//g')
  fi

  # Rename the file
  mv "$file_name" "$new_file_name"
done

