FROM python:3.11-slim

WORKDIR /docs

# Combine RUN commands to reduce layers and optimize cache
RUN apt-get update && apt-get install -y \
    build-essential \
    pandoc \
    && rm -rf /var/lib/apt/lists/* \
    && pip install uv \
    && uv venv .venv

ENV PATH="/docs/.venv/bin:$PATH"

# Copy dependency files first to leverage Docker cache
COPY pyproject.toml requirements.lock ./
RUN uv pip sync requirements.lock

# Copy documentation files last since they change most frequently
COPY docs/ docs/

CMD ["sphinx-build", "-b", "html", "docs", "docs/_build"]