#!/bin/bash
set -e
./scripts/build_docs_locally.sh "$@"
./scripts/serve_docs_locally.sh "$@"