FROM python:3.13.0-bookworm@sha256:a680a0edc77501edf235bcc10e81b23269b7320bbf6067b457534cf199007601

WORKDIR /app/src

COPY api/Pipfile api/Pipfile.lock ./

RUN pip install --no-cache-dir pipenv==2024.1.0 && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
