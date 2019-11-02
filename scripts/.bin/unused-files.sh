#!/bin/bash

# Launch inside a create-react-app project after building the production build.
# Require `jq`.

# diff \
#     <(find src -type f \( -name '*.js' -o -name '*.jsx' -o -name '*.css' \) | sort) \
#     <(find build -iname '*.map' -exec cat {} \; | jq --raw-output '.sources | join("\n")' \
#         | grep -v '\.\./' | grep -E '\.(js|jsx|css)$' \
#         | sed "s#^#src/#" | sort | uniq) \
#     | grep '< ' | sed "s#^< ##" | grep -v 'spec'

diff \
    <(find src -type f \( -name '*.js' -o -name '*.jsx' -o -name '*.css' \) | sed 's/^src\///g' | sort) \
    <(find build -iname '*.map' -exec cat {} \; | jq --raw-output '.sources | join("\n")' \
      | grep -v '\.\./' | grep -E '\.(js|jsx|css)$' \
      | sed "s~^webpack:///\./~~" -r | sort | uniq) \
    | grep '< ' | sed "s#^< ##" | grep -v 'spec'
