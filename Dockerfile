FROM python:3.11-slim
WORKDIR /app
ENV PYTHONPATH="/app:$PYTHONPATH"

RUN apt-get update && apt-get install -y \
    git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN git config --global --add safe.directory /app

RUN pip install poetry
RUN poetry config virtualenvs.create false

COPY pyproject.toml ./
COPY poetry.lock ./
RUN poetry install
