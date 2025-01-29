FROM python:3.11-slim

WORKDIR /docs

RUN apt-get update && apt-get install -y \
    build-essential \
    pandoc \
    && rm -rf /var/lib/apt/lists/* \
    && pip install uv \
    && uv venv .venv

ENV PATH="/docs/.venv/bin:$PATH"
COPY pyproject.toml requirements.lock ./
RUN uv pip sync requirements.lock

COPY docs/ /docs/

CMD ["sphinx-build", "-b", "html", ".", "_build/html"]