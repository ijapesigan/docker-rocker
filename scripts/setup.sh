#!/bin/bash

set -e

if [ -f /run/secrets/GITHUB_PAT ]; then
    GITHUB_PAT=$(cat /run/secrets/GITHUB_PAT)
    export GITHUB_PAT
fi

if [ -n "$GITHUB_PAT" ]; then
    echo "GITHUB_PAT is set (length=$(echo -n "$GITHUB_PAT" | wc -c))"
else
    echo "GITHUB_PAT NOT set"
fi

bash rproject_sys.sh
bash rproject.sh
bash tinytex.sh
bash apptainer.sh
bash custom.sh
bash uv.sh
bash post.sh
