#!/bin/bash

set -e

bash github.sh
bash rproject.sh
bash custom.sh
bash post.sh
