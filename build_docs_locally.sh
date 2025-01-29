#!/bin/bash

echo "Cleaning up previous builds..."
rm -rf ./built-docs
mkdir -p ./built-docs

echo "Building podman image..."
podman build -t docs-builder .

echo "Building documentation..."
podman run --name docs-container docs-builder

echo "Copying built documentation..."
podman cp docs-container:/docs/_build/html/. ./built-docs/

echo "Cleaning up..."
podman rm docs-container

echo "Build complete! Documentation is in ./built-docs"