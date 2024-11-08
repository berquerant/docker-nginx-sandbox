FROM python:3.13.0-bookworm@sha256:feee4734fdc44cc09a3c9cdb72e05bb8ff7e964f64766bc1a68638b2c667cf35

WORKDIR /app/src

COPY api/Pipfile api/Pipfile.lock ./

RUN pip install --no-cache-dir pipenv==2024.4.0 && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
