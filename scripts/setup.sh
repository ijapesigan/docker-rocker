#!/bin/bash

set -e

bash rproject_sys.sh
bash rproject.sh
bash tinytex.sh
bash custom.sh
bash post.sh
