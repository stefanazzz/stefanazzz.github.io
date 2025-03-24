#!/bin/bash

# Output file name
OUTPUT="index.html"

# Start the HTML structure
cat <<EOF > "$OUTPUT"
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>PDF Index</title>
</head>
<body>
  <h1>PDF Files in $(basename "$PWD")</h1>
  <ul>
EOF

# Loop over all .pdf files in the current directory (case-insensitive)
shopt -s nocaseglob  # makes *.pdf match .PDF, .Pdf, etc.
for file in *.pdf; do
  if [ -f "$file" ]; then
    echo "  <li><a href=\"$file\">$file</a></li>" >> "$OUTPUT"
  fi
done
shopt -u nocaseglob

# End the HTML structure
cat <<EOF >> "$OUTPUT"
  </ul>
</body>
</html>
EOF

echo "✅ index.html created with only PDF files!"

