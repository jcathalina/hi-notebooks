#!/bin/bash

echo "Cleaning up previous builds..."
rm -rf ./local-docs
mkdir -p ./local-docs

echo "Building podman image..."
podman build -t docs-builder -f Dockerfile.docs .

echo "Building documentation..."
podman run --name docs-container docs-builder

echo "Copying built documentation..."
podman cp docs-container:/docs/_build/html/. ./local-docs/

echo "Cleaning up..."
podman rm docs-container

echo "Build complete! Documentation is in ./local-docs"