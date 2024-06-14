FROM python:3.12.4-bookworm@sha256:69b5ed7edb7c70b0175a5099eccc86ceb5c0fe39ff94384403ceebc26de7f80e

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.0 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
