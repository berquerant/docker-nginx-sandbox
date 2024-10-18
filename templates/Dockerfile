FROM python:3.13.0-bookworm@sha256:0eb8d3feda44654b7bc3e6e21dd19b793ce9eda75bbd0cf16a2407a1f0a4448b

WORKDIR /app/src

COPY api/Pipfile api/Pipfile.lock ./

RUN pip install --no-cache-dir pipenv==2024.1.0 && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
