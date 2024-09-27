FROM python:3.12.6-bookworm@sha256:f48a45f56748d5305ca47639bef8b3cfa005243fddedd3d84c9f5193dd8b3275

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.2 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
