#!/usr/bin/env bash
# export selectively the wiki to a self-contained index.html
#
# Note that a tiddle filter is contained in the wiki 
# that prevents export of "private" tags:
#
# title: $:/PublishFilter
# tags: $:/tags/Macro
# type: text/vnd.tiddlywiki
# content:
# \define publishFilter()
# -[tag[private]]
# \end
# set -euo pipefail

rm -rf public
mkdir -p public public/files

# Build single-file wiki
tiddlywiki . --output ./public --rendertiddler '$:/core/save/all' index.html text/plain

# Copy attachments, excluding private subfolder
rsync -av --delete \
  --exclude 'private_files/' \
  files/ public/files/


