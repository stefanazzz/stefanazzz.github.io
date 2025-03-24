
#!/bin/bash

# Name of output file
OUTPUT="index.html"

# Start HTML boilerplate
cat <<EOF > $OUTPUT
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>File Index</title>
</head>
<body>
  <h1>Index of $(basename "$PWD")</h1>
  <ul>
EOF

# Loop over files (not folders) in the current directory
for file in *; do
  if [ -f "$file" ] && [ "$file" != "$OUTPUT" ]; then
    echo "  <li><a href=\"$file\">$file</a></li>" >> $OUTPUT
  fi
done

# End HTML
cat <<EOF >> $OUTPUT
  </ul>
</body>
</html>
EOF

echo "✅ index.html generated!"

