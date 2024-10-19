FROM python:3.13.0-bookworm@sha256:d6038cd5fe90d591c8a7589330b003fc0ae7ac2958d4b9e1b90e0f88515154b5

WORKDIR /app/src

COPY api/Pipfile api/Pipfile.lock ./

RUN pip install --no-cache-dir pipenv==2024.1.0 && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
