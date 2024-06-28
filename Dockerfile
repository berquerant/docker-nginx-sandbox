FROM python:3.12.4-bookworm@sha256:83f5f8714b6881d3e0e91023d9fe9e43aa6ad5a04e9f9a94ee180b18b021c72a

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.1 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
