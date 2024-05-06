#!/bin/bash

# Navigate to the Contents directory
cd Contents

# Loop through all .tex files, excluding 01-manifest.tex
for file in *.tex; do
    if [ "$file" != "01-manifest.tex" ]; then
        # Extract the filename without extension
        base_name=$(basename "$file" .tex)

        # Remove \begin{markdown} and \end{markdown}, save as .md
        sed '/\\begin{markdown}/,/\\end{markdown}/!d;//d' "$file" > "$base_name.md"

        # Use Pandoc to convert the .md file back to .tex with the same name
        pandoc "$base_name.md" -s --biblatex --bibliography=plantar.bib -o "$base_name.tex"

        # Optional: Remove the intermediate .md file
        rm "$base_name.md"
    fi
done

# Return to the original directory
cd -
