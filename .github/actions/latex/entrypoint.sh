#!/usr/bin/env bash
set -eux

# build pdf (change if necessary)
latexmk

TAG_NAME=${GITHUB_REF:11}

# create release
# "tag_name" must be unique
res=$(curl -H "Authorization: token ${GITHUB_TOKEN}" -X POST "https://api.github.com/repos/${GITHUB_REPOSITORY}/releases" \
-d "
{
  \"tag_name\": \"${GITHUB_SHA:34}\",
  \"target_commitish\": \"${GITHUB_SHA}\",
  \"name\": \"$(echo main.pdf ${TAG_NAME})\",
  \"draft\": false,
  \"prerelease\": false
}")

# extract release id
rel_id=$(echo "${res}" | python3 -c 'import json, sys; print(json.load(sys.stdin)["id"])')

# upload built pdf
curl -H "Authorization: token ${GITHUB_TOKEN}" -X POST "https://uploads.github.com/repos/${GITHUB_REPOSITORY}/releases/${rel_id}/assets?name=main.pdf" \
  --header 'Content-Type: application/pdf' \
  --upload-file build/main.pdf
